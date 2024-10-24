<?php
include('includes/head.php'); 
include('includes/navigation.php'); 
include('includes/sidebar.php'); 
include('../connect.php'); // Database connection

// Handle news feed actions
if (isset($_POST['action'])) {
    if ($_POST['action'] == 'create') {
        $title = $_POST['title'];
        $content = $_POST['content'];
        $query = "INSERT INTO news_feed (title, content) VALUES ('$title', '$content')";
        $db->prepare($query)->execute();
    } elseif ($_POST['action'] == 'update') {
        $id = $_POST['id'];
        $title = $_POST['title'];
        $content = $_POST['content'];
        $query = "UPDATE news_feed SET title='$title', content='$content' WHERE id=$id";
        $db->prepare($query)->execute();
    } elseif ($_POST['action'] == 'delete') {
        $id = $_POST['id'];
        $query = "DELETE FROM news_feed WHERE id=$id";
        $db->prepare($query)->execute();
    }
}

// Fetch news feed data
$newsFeeds = $db->prepare("SELECT * FROM news_feed");
$newsFeeds->execute();
$newsFeeds = $newsFeeds->fetchAll();
?>

<div class="page-wrapper">
    <div class="content">
        <div class="row">
            <div class="col-sm-4">
                <h4 class="page-title">Manage News Feed</h4>
            </div>
        </div>

        <!-- Create News Feed Form -->
        <form method="POST" action="news_feed.php">
            <input type="hidden" name="action" value="create">
            <div class="form-group">
                <label>Title</label>
                <input type="text" name="title" class="form-control">
            </div>
            <div class="form-group">
                <label>Content</label>
                <textarea name="content" class="form-control"></textarea>
            </div>
            <button type="submit" class="btn btn-primary">Create</button>
        </form>

        <hr>

        <!-- Display News Feed List -->
        <table class="table">
            <thead>
                <tr>
                    <th>Title</th>
                    <th>Content</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($newsFeeds as $newsFeed) { ?>
                <tr>
                    <td><?php echo $newsFeed['title']; ?></td>
                    <td><?php echo $newsFeed['content']; ?></td>
                    <td>
                        <form method="POST" action="news_feed.php" style="display:inline;">
                            <input type="hidden" name="id" value="<?php echo $newsFeed['id']; ?>">
                            <input type="hidden" name="action" value="delete">
                            <button type="submit" class="btn btn-danger">Delete</button>
                        </form>
                        <button class="btn btn-warning" onclick="editNews(<?php echo $newsFeed['id']; ?>, '<?php echo $newsFeed['title']; ?>', '<?php echo $newsFeed['content']; ?>')">Edit</button>
                    </td>
                </tr>
                <?php } ?>
            </tbody>
        </table>

        <!-- Update News Feed Form (hidden by default) -->
        <form method="POST" action="news_feed.php" id="editForm" style="display:none;">
            <input type="hidden" name="action" value="update">
            <input type="hidden" name="id" id="newsId">
            <div class="form-group">
                <label>Title</label>
                <input type="text" name="title" id="newsTitle" class="form-control">
            </div>
            <div class="form-group">
                <label>Content</label>
                <textarea name="content" id="newsContent" class="form-control"></textarea>
            </div>
            <button type="submit" class="btn btn-success">Update</button>
        </form>

    </div>
</div>

<script>
function editNews(id, title, content) {
    document.getElementById('editForm').style.display = 'block';
    document.getElementById('newsId').value = id;
    document.getElementById('newsTitle').value = title;
    document.getElementById('newsContent').value = content;
}
</script>

