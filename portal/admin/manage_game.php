<?php
include 'includes/head.php';
include 'includes/navigation.php';
include 'includes/sidebar.php';
include '../connect.php'; // Database connection

// Handle form submissions for creating new challenges
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    if (isset($_POST['challenge']) && isset($_POST['reward'])) {
        $challenge_text = $_POST['challenge'];
        $reward = $_POST['reward'];

        // Insert new challenge into the database
        $sql = "INSERT INTO game_challenges (challenge_text, reward) VALUES (:challenge_text, :reward)";
        $stmt = $db->prepare($sql);
        $stmt->bindParam(':challenge_text', $challenge_text);
        $stmt->bindParam(':reward', $reward);
        if ($stmt->execute()) {
            echo "<div class='alert alert-success'>Challenge created successfully!</div>";
        } else {
            echo "<div class='alert alert-danger'>Error creating challenge!</div>";
        }
    }

    // Handle reward announcement
    if (isset($_POST['reward_announcement'])) {
        $announcement_text = $_POST['reward_announcement'];

        // Insert reward announcement into the database
        $sql = "INSERT INTO reward_announcements (announcement_text) VALUES (:announcement_text)";
        $stmt = $db->prepare($sql);
        $stmt->bindParam(':announcement_text', $announcement_text);
        if ($stmt->execute()) {
            echo "<div class='alert alert-success'>Reward announcement posted!</div>";
        } else {
            echo "<div class='alert alert-danger'>Error posting reward announcement!</div>";
        }
    }
}
?>

<div class="page-wrapper">
    <div class="content">
        <!-- Create New Challenge Section -->
        <h3>Manage Game Challenges</h3>
        <form action="manage_game.php" method="POST">
            <div class="form-group">
                <label for="challenge">Create New Challenge</label>
                <input type="text" class="form-control" id="challenge" name="challenge" placeholder="Enter challenge question" required>
            </div>
            <div class="form-group">
                <label for="reward">Reward</label>
                <input type="text" class="form-control" id="reward" name="reward" placeholder="Enter reward details" required>
            </div>
            <button type="submit" class="btn btn-primary">Submit</button>
        </form>

        <!-- Leaderboard Section -->
        <h3>Leaderboard</h3>
        <div class="leaderboard">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Rank</th>
                        <th>User ID</th>
                        <th>Score</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    // Fetch leaderboard data from the database
                    $sql = "SELECT * FROM leaderboard ORDER BY rank ASC";
                    $stmt = $db->prepare($sql);
                    $stmt->execute();
                    while ($row = $stmt->fetch()) {
                        echo "<tr>
                                <td>{$row['rank']}</td>
                                <td>{$row['user_id']}</td>
                                <td>{$row['score']}</td>
                              </tr>";
                    }
                    ?>
                </tbody>
            </table>
        </div>

        <!-- Rewards Announcement Section -->
        <h3>Rewards Announcement</h3>
        <form action="manage_game.php" method="POST">
            <div class="form-group">
                <label for="reward_announcement">Reward Announcement</label>
                <textarea class="form-control" id="reward_announcement" name="reward_announcement" rows="4" placeholder="Announce rewards for top users" required></textarea>
            </div>
            <button type="submit" class="btn btn-success">Announce</button>
        </form>
    </div>
</div>

