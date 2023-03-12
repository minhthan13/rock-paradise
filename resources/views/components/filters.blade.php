<form method="POST" action="/">
    @csrf
    <label>Color Filter</label><br />
    <input type="checkbox" name="color[]" value="red" />Red<br>
    <input type="checkbox" name="color[]" value="blue" />Blue<br>
    <input type="checkbox" name="color[]" value="green" />Green<br>
    <button type="submit">Filter</button>
</form>
