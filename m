Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8352614DE
	for <lists.iommu@lfdr.de>; Tue,  8 Sep 2020 18:40:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2961C86B59;
	Tue,  8 Sep 2020 16:40:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sTtx9fqclF0A; Tue,  8 Sep 2020 16:40:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id CFACE86BCF;
	Tue,  8 Sep 2020 16:40:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AF279C0051;
	Tue,  8 Sep 2020 16:40:05 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CCDC2C0051
 for <iommu@lists.linux-foundation.org>; Tue,  8 Sep 2020 16:40:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id B6A3286B59
 for <iommu@lists.linux-foundation.org>; Tue,  8 Sep 2020 16:40:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z4p1BQ1zvDjy for <iommu@lists.linux-foundation.org>;
 Tue,  8 Sep 2020 16:40:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id D2BFC8693F
 for <iommu@lists.linux-foundation.org>; Tue,  8 Sep 2020 16:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=Bz/NFWcHfpE2ibPZ40IxOxsK0QdjA6v17AiYva1omU0=; b=NZjqLC2/EzhzadWZmU8T6PNfDs
 VeI6B3RRbpFXVqnNgTp6e94R1w0bVqib67gZLOfNPJnzFyAc0YP4/Tfr6ml76NGchvS/hbxsIjmoW
 SqjnXlsZqujJJ43KqlMaUseQo/9qTFv0EjNzxBmVO8iorMvcxClm47XeBxf1CbgCJbFFMy07sAsSX
 leSyI4ZPdNraTXqCL1fWPOG6KPoJxBshd30oJj0RhFllB0zhh3Qzeu/boYvs9nbNikrTqseFsH/i+
 x5r4VbKGrVe/GGAA+XkDnOLDome8v9kSoMWFbh1aGGNHjp1rwewpLOQSJ1IMyTboJn6sJ8o74Ys4x
 obG6lqhg==;
Received: from [2001:4bb8:184:af1:3dc3:9c83:fc6c:e0f] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFgf2-0000rg-TC; Tue, 08 Sep 2020 16:40:01 +0000
From: Christoph Hellwig <hch@lst.de>
To: iommu@lists.linux-foundation.org
Subject: drop a few unused DMA exports
Date: Tue,  8 Sep 2020 18:39:57 +0200
Message-Id: <20200908163959.3177173-1-hch@lst.de>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: Robin Murphy <robin.murphy@arm.com>
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

Hi all,

this series removes a bunch of (now) unused exports in the DMA mapping
subsystem.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
