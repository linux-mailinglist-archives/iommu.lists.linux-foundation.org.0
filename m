Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 190ED1E1836
	for <lists.iommu@lfdr.de>; Tue, 26 May 2020 01:26:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0CB9B859EF;
	Mon, 25 May 2020 23:26:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W3oBQc5-O_gm; Mon, 25 May 2020 23:26:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3ED1E84DD5;
	Mon, 25 May 2020 23:26:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 24D5BC016F;
	Mon, 25 May 2020 23:26:28 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B11ABC016F
 for <iommu@lists.linux-foundation.org>; Mon, 25 May 2020 21:50:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 978C322744
 for <iommu@lists.linux-foundation.org>; Mon, 25 May 2020 21:50:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1iw8ReZe7ozE for <iommu@lists.linux-foundation.org>;
 Mon, 25 May 2020 21:50:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
 [209.85.208.195])
 by silver.osuosl.org (Postfix) with ESMTPS id 9E02720367
 for <iommu@lists.linux-foundation.org>; Mon, 25 May 2020 21:50:09 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id l15so21809244lje.9
 for <iommu@lists.linux-foundation.org>; Mon, 25 May 2020 14:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SN+dpM083Q42WyxXGNQ6xV5UDjJbvXB3xjH8Bfi3+R4=;
 b=iNPRVl1+0sXuFo5rG2XVtbvjpacafwwSP9/HHJnuwh78ckDWfgnyiZtoN8D79+H04L
 lBo4mzux5NhMOXTMZ9+0mZQmU9FkdFhKDbiFSjXWOLq2XZ22HfmikY7OK67WjWgsCiwU
 erBDnzlqYd1nNgSOwSkIYkhZNU2H1nK+/g3awgjOMwWcK7HAABBFoAuC/sJwItRZT0su
 7z0d+hgxWhI4j4Oop9DWoPFXeNjrW3W9TW0vKmpx8sxH0ffJiSLgLTj4RI9/Xa6V8xHY
 centR91Xm2qya/eiDtv8aPXy6SDfJVJL1x3liEYifA7kaPMKwjufG6g0jxoe2XQp4Ifb
 006A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SN+dpM083Q42WyxXGNQ6xV5UDjJbvXB3xjH8Bfi3+R4=;
 b=q9fH4Xj5Nnn7ZwciIKpKwjzBFhVYPglKh8Tgit38TxwsGJ3SWn+enEYDI08Jkvq2JQ
 8n8NpLPYdZifB0FH5dEEzZKI6xdDsHFxWSf3sf8SBr/hJDtdKwqIf0EocrTA4cFHI1xr
 gulROfo2BIrZvnC7jfYDxQzWwDtS9Jz8MDMdBOsFjVZjSPPwzcGsSvAEXZkNRdPLDdul
 O7lSKdbGWtkiEZxU9zUeN36xOXrwReELx6WYAGfvu+cFtkVb1JYjcsBX9ytH7gw8utm/
 lH/sJ28flZQ+Wd5uvZ9PS0f0DvVAtehHgLouBDnrG5Jx4jVbtzlUvM+9yF2hrRISByGo
 tZgw==
X-Gm-Message-State: AOAM533lV+BZ9gVXeQpr2v8AHQ797RBCd85NpVBxsWYncH8zkBP/w6j3
 o/SOoAMQ/eV+deaTsF6T7tc=
X-Google-Smtp-Source: ABdhPJxnTbunGio3cdXh+qjthmCHup2QsAXievRHBLyH46bK73IEPo4+D9loPtgYWGKOYBGDBCRTMw==
X-Received: by 2002:a2e:a318:: with SMTP id l24mr13657060lje.45.1590443407765; 
 Mon, 25 May 2020 14:50:07 -0700 (PDT)
Received: from localhost.localdomain (h-158-174-22-22.NA.cust.bahnhof.se.
 [158.174.22.22])
 by smtp.gmail.com with ESMTPSA id e21sm3893338ljj.86.2020.05.25.14.50.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 May 2020 14:50:07 -0700 (PDT)
From: Rikard Falkeborn <rikard.falkeborn@gmail.com>
To: Joerg Roedel <joro@8bytes.org>
Subject: [PATCH 0/2] drivers/iommu: Constify structs
Date: Mon, 25 May 2020 23:49:56 +0200
Message-Id: <20200525214958.30015-1-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 25 May 2020 23:26:27 +0000
Cc: Wei Liu <wei.liu@kernel.org>, Stephen Hemminger <sthemmin@microsoft.com>,
 linux-hyperv@vger.kernel.org, Haiyang Zhang <haiyangz@microsoft.com>,
 linux-kernel@vger.kernel.org, Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, iommu@lists.linux-foundation.org,
 Maxime Ripard <mripard@kernel.org>, "K. Y. Srinivasan" <kys@microsoft.com>,
 linux-arm-kernel@lists.infradead.org
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development issues for Linux IOMMU support
 <iommu.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/iommu>,
 <mailto:iommu-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/iommu/>
List-Post: <mailto:iommu@lists.linux-foundation.org>
List-Help: <mailto:iommu-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/iommu>,
 <mailto:iommu-request@lists.linux-foundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

Constify some structs with function pointers to allow the compiler to
put them in read-only memory. There is not dependency between the
patches.

Rikard Falkeborn (2):
  iommu/hyper-v: Constify hyperv_ir_domain_ops
  iommu/sun50i: Constify sun50i_iommu_ops

 drivers/iommu/hyperv-iommu.c | 2 +-
 drivers/iommu/sun50i-iommu.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.26.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
