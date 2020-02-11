Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E72159A1C
	for <lists.iommu@lfdr.de>; Tue, 11 Feb 2020 20:58:40 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 6C723204A8;
	Tue, 11 Feb 2020 19:58:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wMQPVcTVRJhd; Tue, 11 Feb 2020 19:58:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 652DC20524;
	Tue, 11 Feb 2020 19:58:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 59DEDC1D8E;
	Tue, 11 Feb 2020 19:58:38 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4C78CC07FE
 for <iommu@lists.linux-foundation.org>; Tue, 11 Feb 2020 19:58:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 3642F85DFF
 for <iommu@lists.linux-foundation.org>; Tue, 11 Feb 2020 19:58:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 01upIND7ID6q for <iommu@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 19:58:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-yb1-f195.google.com (mail-yb1-f195.google.com
 [209.85.219.195])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id B65C284D81
 for <iommu@lists.linux-foundation.org>; Tue, 11 Feb 2020 19:58:34 +0000 (UTC)
Received: by mail-yb1-f195.google.com with SMTP id v12so5995229ybi.5
 for <iommu@lists.linux-foundation.org>; Tue, 11 Feb 2020 11:58:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:cc:date:message-id:user-agent:mime-version
 :content-transfer-encoding;
 bh=2VAKAcpr2MBf9aCgMT8aEt9dlXUjbR7WNAT7b1h4DfU=;
 b=IGKGQ8U3cBDlzKSlnhA0V67hzzRvIfMmkGn/ymxAOM3RjjQ5hiKnTkLVzEqdqnshQC
 /gHwaglw3UPDhyVEq20oiMw/6LVdy0adv3jkfjp5FSm3b53gny6KJpmCq0ySKIEL4dM+
 hFkIHQbQkXkwgjHuSg7Pec039lilWf+RX6nk/C0jqDzWplGreBV9XzkSEcObogDsrFaq
 l/XjbrP1AcBuLIzZO1anB9qhgezK3xMIoAAjlr709CASR/ppdU+nN/mi1AEk2QmjgV05
 EagoDGylukfGmBHqBlf6y0irlPLjOxZMAKJ7W1pZJuxoxhdU9RXplbHLeFvEg/paHSy8
 00Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:cc:date:message-id
 :user-agent:mime-version:content-transfer-encoding;
 bh=2VAKAcpr2MBf9aCgMT8aEt9dlXUjbR7WNAT7b1h4DfU=;
 b=Kp0t3KsJEOv0usDTYJsK4SCDENJ1D3yXg5CfBn1FLmN0oZG7LhlkN5idQsofOjYDj2
 bq4To/lqXWC6nuHgjpBE73WAlx7DvHdN6sn/FTH03NztYpsE0ht146cN9OoZDDKALork
 d6k1b9AX+OgDEVhCAPd9PyjJxolGu8wk9GAcQ9WXXBsp2XwKMksIjQdZXLDUtb2OnZp3
 xpiIE21r0vWGFivB5pZ5YpsqlhYUwy9fHWJnQoNMcjFeQ4OyBAQSIh/Y+4YiwIM0Lwpt
 AIhgMW5mQ8yUK8jDWEjhO57lVl8aib/jqwEgzMYnjVpaVw1TBUMoiWkwjzD6phQsf3ah
 w7IA==
X-Gm-Message-State: APjAAAX2irDBbzT8qve8KOfyX6WqMgdjbo8LXUgQ85DvDNofyqmL3mXf
 t5DaYgZJqoNLG/rdircagTw=
X-Google-Smtp-Source: APXvYqyR6tQBxznLio5WOdQRmoOf2A1BZj5rBYROoLsitL5AXXNMcSjYGvkkUATssKixsl6iBp178A==
X-Received: by 2002:a5b:88e:: with SMTP id e14mr7583149ybq.338.1581451113808; 
 Tue, 11 Feb 2020 11:58:33 -0800 (PST)
Received: from gateway.1015granger.net (c-68-61-232-219.hsd1.mi.comcast.net.
 [68.61.232.219])
 by smtp.gmail.com with ESMTPSA id y17sm2424561ywd.23.2020.02.11.11.58.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 11 Feb 2020 11:58:33 -0800 (PST)
Received: from morisot.1015granger.net (morisot.1015granger.net [192.168.1.67])
 by gateway.1015granger.net (8.14.7/8.14.7) with ESMTP id 01BJwUkL018987;
 Tue, 11 Feb 2020 19:58:31 GMT
Subject: [PATCH v1] xprtrdma: Fix DMA scatter-gather list mapping imbalance
From: Chuck Lever <chuck.lever@oracle.com>
To: andre@tomt.net
Date: Tue, 11 Feb 2020 14:58:30 -0500
Message-ID: <158145102079.515252.3226617475691911684.stgit@morisot.1015granger.net>
User-Agent: StGit/0.19
MIME-Version: 1.0
Cc: linux-nfs@vger.kernel.org, robin.murphy@arm.com,
 iommu@lists.linux-foundation.org
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

The @nents value that was passed to ib_dma_map_sg() has to be passed
to the matching ib_dma_unmap_sg() call. If ib_dma_map_sg() choses to
concatenate sg entries, it will return a different nents value than
it was passed.

The bug was exposed by recent changes to the AMD IOMMU driver.

Reported-by: Andre Tomt <andre@tomt.net>
Suggested-by: Robin Murphy <robin.murphy@arm.com>
Fixes: 1f541895dae9 ("xprtrdma: Don't defer MR recovery if ro_map fails")
Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
---
 net/sunrpc/xprtrdma/frwr_ops.c |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

Hey Andre, please try this out. It just reverts the bit of brokenness that
Robin observed this morning. I've done basic testing here with Intel
IOMMU systems, no change in behavior (ie, all good to go).

diff --git a/net/sunrpc/xprtrdma/frwr_ops.c b/net/sunrpc/xprtrdma/frwr_ops.c
index 095be887753e..449bb51e4fe8 100644
--- a/net/sunrpc/xprtrdma/frwr_ops.c
+++ b/net/sunrpc/xprtrdma/frwr_ops.c
@@ -313,10 +313,9 @@ struct rpcrdma_mr_seg *frwr_map(struct rpcrdma_xprt *r_xprt,
 			break;
 	}
 	mr->mr_dir = rpcrdma_data_dir(writing);
+	mr->mr_nents = i;
 
-	mr->mr_nents =
-		ib_dma_map_sg(ia->ri_id->device, mr->mr_sg, i, mr->mr_dir);
-	if (!mr->mr_nents)
+	if (!ib_dma_map_sg(ia->ri_id->device, mr->mr_sg, i, mr->mr_dir))
 		goto out_dmamap_err;
 
 	ibmr = mr->frwr.fr_mr;


_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
