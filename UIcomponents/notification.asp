<div class="notification" id='notification'>
    <i class='lni lni-warning'></i>
    <h3 id='context-detail'>valon</h3>
</div>
<script>
    const notification = (content,color) => {
        var slideout = document.getElementById('notification');
        slideout.style.backgroundColor = color;
        var context = document.getElementById('context-detail');
        context.innerHTML = content;
        slideout.classList.toggle('triggered');
        setTimeout(() => {
            slideout.classList.toggle('triggered');
        }, 3000);
    }
</script>
