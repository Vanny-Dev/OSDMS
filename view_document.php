<?php
error_reporting(E_ERROR | E_PARSE);
include 'db_connect.php';
$qry = $conn->query("SELECT * FROM documents where md5(id) = '{$_GET['id']}' ")->fetch_array();
foreach($qry as $k => $v){
	if($k == 'title')
		$k = 'ftitle';
	$$k = $v;
}
?>

<?php
$getUserId = $conn->query("select firstname,lastname from users where id = '{$_SESSION['login_id']}' ")->fetch_array();
//echo $getUserId['firstname'] . $getUserId['lastname'];

$getDocumentTitle = $conn->query("SELECT title FROM documents where md5(id) = '{$_GET['id']}' ")->fetch_array();
//echo $getDocumentTitle['title'];

$getDocumentId = $conn->query("SELECT id FROM documents where md5(id) = '{$_GET['id']}' ")->fetch_array();

date_default_timezone_set('Asia/Manila');
$date = date('m/d/Y h:i:s a', time());
//echo $date;

if($_SESSION['isViewed'.$_GET['id'].$_SESSION['login_id']] != 1) {
	$_SESSION['isViewed'.$_GET['id'].$_SESSION['login_id']] = 1;
	$viewQuery = $conn->query("INSERT INTO viewer (id, viewer_id, document_id, document_title, date) VALUES (0, '". $getUserId['firstname'] . ' ' .  $getUserId['lastname'] ."', '".$getDocumentId['id']."', '". $getDocumentTitle['title'] ."', '". $date."')");
}

?>
<div class="col-lg-12">
      <?php if(isset($_SESSION['login_id'])): ?>
	<div class="row">
		<div class="col-md-12 mb-2">
			<button class="btn bg-light border float-right" type="button" id="share"><i class="fa fa-share"></i> Share This Document</button>
		</div>
	</div>
    <?php endif; ?>
	<div class="row">
		<div class="col-md-7">
			<div class="card card-outline card-info">
				<div class="card-header">
					<div class="card-tools">
						<small class="text-muted">
							Date Uploaded: <?php echo date("M d, Y",strtotime($date_created)) ?>
						</small>
					</div>
				</div>
				<div class="card-body">
					<div class="callout callout-info">
						<dl>
							<dt>Title</dt>
							<dd><?php echo $ftitle ?></dd>
						</dl>
					</div>
					<div class="callout callout-info">
						<dl>
							<dt>Description</dt>
							<dd><?php echo html_entity_decode($description) ?></dd>
						</dl>
					</div>
				</div>
			</div>
		</div>
		<div class="col-md-5">
			<div class="card card-outline card-primary">
				<div class="card-header">
					<h3><b>File/s</b></h3>
				</div>
				<div class="card-body">
					<div class="col-md-12">
						<div class="alert alert-info px-2 py-1"><i class="fa fa-info-circle"></i> Click the file to download.</div>
						<div class="row">
							 <?php
					            if(isset($file_json) && !empty($file_json)):
					              foreach(json_decode($file_json) as $k => $v):
					                if(is_file('assets/uploads/'.$v)):
					                $_f = file_get_contents('assets/uploads/'.$v);
					                $dname = explode('_', $v);
					         ?>
		 
							<div class="col-sm-3">
								<a href="download.php?f=<?php echo $v ?>" target="_blank" class="text-white border-rounded file-item p-1">
			                      <span class="img-fluid bg-dark border-rounded px-2 py-2 d-flex justify-content-center align-items-center" style="width: 100px;height: 100px">
			                      	<h3 class="bg-dark"><i class="fa fa-download"></i></h3>
			                      </span>
			                      <span class="text-dark"><?php echo $dname[1] ?></span>
			                    </a>
							</div>
							 <?php endif; ?>
					         <?php endforeach; ?>
					         <?php endif; ?>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	$('.file-item').hover(function(){
		$(this).addClass("active")
	})
	$('file-item').mouseout(function(){
		$(this).removeClass("active")
	})
	$('.file-item').click(function(e){
		e.preventDefault()
		_conf("Are you sure to download this file?","dl",['"'+$(this).attr('href')+'"'])
	})
	function dl($link){
		start_load()
		window.open($link,"_blank")
		end_load()
	}
	$('#share').click(function(){
		uni_modal("<i class='fa fa-share'></i> Share this document using the link.","modal_share_link.php?did=<?php echo md5($id) ?>")
	})
</script>