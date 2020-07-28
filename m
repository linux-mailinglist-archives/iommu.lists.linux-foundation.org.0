Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id ED47623080E
	for <lists.iommu@lfdr.de>; Tue, 28 Jul 2020 12:47:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 929AC86AB6;
	Tue, 28 Jul 2020 10:47:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mcsEFX6Lw1n1; Tue, 28 Jul 2020 10:47:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 322A186C1A;
	Tue, 28 Jul 2020 10:47:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1C961C0050;
	Tue, 28 Jul 2020 10:47:56 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B741FC004D
 for <iommu@lists.linux-foundation.org>; Tue, 28 Jul 2020 10:47:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id A5ABF86C34
 for <iommu@lists.linux-foundation.org>; Tue, 28 Jul 2020 10:47:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id swfUVOZMMq14 for <iommu@lists.linux-foundation.org>;
 Tue, 28 Jul 2020 10:47:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by whitealder.osuosl.org (Postfix) with ESMTPS id B8FB586AB6
 for <iommu@lists.linux-foundation.org>; Tue, 28 Jul 2020 10:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=A/HaQ2Tq5vNWHADp2RfISDsPIG7SE9SFlUAr+s1HeIw=; b=hyfcByvODdGJ7du7+4frnKlxAK
 96pOqjkmhq6+e3XgGFtmCOJo/D6js/HUouO4rr4YUaAfkFVhs09LEVKfgU2f6ZCrJliyHfIeV+6mI
 zmE69ua3JDgZWdgvvas/wj1HKjeqWAf4dzMIEW7t4vMiWI+6jhbCOXvHFSbW1PudIkaIHHemKD6Ih
 7GtpC1lA8GyZ3Pw42ABGDERJXOU/V/F/PMu5H713uGirsw0GRLbemVg/pQKFEguu/mWj9vaqefmxr
 LFeGZAzCXmIhn3rzcfj/oB0T0F7uG02Fj6vi+oxehCnY9b6LsaOQ5/VCV/1iG/Gv1ALPRFfR/0/Xv
 dFbG2Hvg==;
Received: from [2001:4bb8:180:6102:7902:553b:654a:8555] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0N96-0004rU-JP; Tue, 28 Jul 2020 10:47:45 +0000
From: Christoph Hellwig <hch@lst.de>
To: Amit Pundir <amit.pundir@linaro.org>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Subject: dma-pool fixes
Date: Tue, 28 Jul 2020 12:47:40 +0200
Message-Id: <20200728104742.422960-1-hch@lst.de>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>,
 linux-rpi-kernel@lists.infradead.org, jeremy.linton@arm.com,
 David Rientjes <rientjes@google.com>
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

Hi Amit,

can you try these two patches?  The first one makes sure we don't apply
physical address based checks for IOMMU allocations, and the second one
is a slightly tweaked version of the patch from Nicolas to allow dipping
into the CMA areas for allocations to expand the atomic pools.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
