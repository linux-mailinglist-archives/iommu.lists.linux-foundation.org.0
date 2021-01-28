Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 133F63078D5
	for <lists.iommu@lfdr.de>; Thu, 28 Jan 2021 16:01:06 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7FCF3865C1;
	Thu, 28 Jan 2021 15:01:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o_8o7YLt7YYd; Thu, 28 Jan 2021 15:01:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B2AC986885;
	Thu, 28 Jan 2021 15:01:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 88BFEC08A1;
	Thu, 28 Jan 2021 15:01:04 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3BB6FC08A1
 for <iommu@lists.linux-foundation.org>; Thu, 28 Jan 2021 15:01:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 35B752E0F2
 for <iommu@lists.linux-foundation.org>; Thu, 28 Jan 2021 15:01:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OO2w9pgX85Hf for <iommu@lists.linux-foundation.org>;
 Thu, 28 Jan 2021 15:01:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by silver.osuosl.org (Postfix) with ESMTPS id D83772DEC9
 for <iommu@lists.linux-foundation.org>; Thu, 28 Jan 2021 15:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=MuQ55b6lQL0I5ueFfXsRaK8O5AcvEo+mmGNhqsq60gQ=; b=jkYUSm/Yl0s99oYdm2MBlnRPAI
 lagIosX5PANZ3deQL5v4LMDMKT3UMoOm+aTiACikMRmoxifXT41M5Y/0ShZxFrvvSzstoAJnErTHK
 sxNg6SQH+oqGmJpU3lfzDmo+XVYEIY0MYUEMZyWnhpVQQFgtH+c7ihkHuoptUM3I2Wgkcyu/41gEa
 IHZ0SZckorrXIgrxh3nIYif6YcIX/mGnRB1KAVdTOCNLMUwFUUmLoauj5Qqi3kl4OZDJ8lAt28LvV
 KaGDSc5P0AcQQfkhO7vHx/0U4thIwIlCbZFvyiuKcGRLoMbpYzx7nHXwc04Obj1pFaitsdln3g6hr
 UquB1PxQ==;
Received: from 213-225-36-89.nat.highway.a1.net ([213.225.36.89]
 helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1l58mv-008bD0-Sl; Thu, 28 Jan 2021 15:00:50 +0000
From: Christoph Hellwig <hch@lst.de>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Tomasz Figa <tfiga@chromium.org>, Ricardo Ribalda <ribalda@chromium.org>,
 Sergey Senozhatsky <senozhatsky@google.com>,
 iommu@lists.linux-foundation.org
Subject: add a new dma_alloc_noncontiguous API
Date: Thu, 28 Jan 2021 15:58:31 +0100
Message-Id: <20210128145837.2250561-1-hch@lst.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: linux-media@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
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

this series adds the new noncontiguous DMA allocation API requested by
various media driver maintainers.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
