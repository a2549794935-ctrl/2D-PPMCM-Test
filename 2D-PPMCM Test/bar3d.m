function bar3d(x, y, z, dx, dy, varargin)

    z0 = 0;

    
    X = [x - dx/2, x + dx/2, x + dx/2, x - dx/2, x - dx/2, x + dx/2, x + dx/2, x - dx/2];
    Y = [y - dy/2, y - dy/2, y + dy/2, y + dy/2, y - dy/2, y - dy/2, y + dy/2, y + dy/2];
    Z = [z0, z0, z0, z0, z, z, z, z];

    faces = [
        1 2 3 4;  % bottom
        5 6 7 8;  % top
        1 2 6 5;  % front
        2 3 7 6;  % right
        3 4 8 7;  % back
        4 1 5 8;  % left
    ];
 
    p = patch('Vertices', [X(:) Y(:) Z(:)], ...
              'Faces', faces, ...
              'FaceColor', [0.6 0.8 1], ...
              'EdgeColor', 'none', ...     
              'FaceAlpha', 0.6, ...
              varargin{:});

   
    top_face = faces(2, :); 
    V = [X(:), Y(:), Z(:)];
    hold on;
    plot3(V(top_face([1 2]),1), V(top_face([1 2]),2), V(top_face([1 2]),3), 'k');
    plot3(V(top_face([2 3]),1), V(top_face([2 3]),2), V(top_face([2 3]),3), 'k');
    plot3(V(top_face([3 4]),1), V(top_face([3 4]),2), V(top_face([3 4]),3), 'k');
    plot3(V(top_face([4 1]),1), V(top_face([4 1]),2), V(top_face([4 1]),3), 'k');
end
