Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id E65EA261556
	for <lists.iommu@lfdr.de>; Tue,  8 Sep 2020 18:48:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9B71285FED;
	Tue,  8 Sep 2020 16:48:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2-KrDQruZQ2Q; Tue,  8 Sep 2020 16:48:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6456186849;
	Tue,  8 Sep 2020 16:48:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 565A7C089E;
	Tue,  8 Sep 2020 16:48:19 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 74FD8C088B
 for <iommu@lists.linux-foundation.org>; Tue,  8 Sep 2020 16:48:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 63C4085EF5
 for <iommu@lists.linux-foundation.org>; Tue,  8 Sep 2020 16:48:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bNI6Fer3y1DY for <iommu@lists.linux-foundation.org>;
 Tue,  8 Sep 2020 16:48:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 7E32E85BDF
 for <iommu@lists.linux-foundation.org>; Tue,  8 Sep 2020 16:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=xF9RZXKA4EiFQUj/JjM3EuzJl40Uj2VLvNxxwGRDZAM=; b=gayIdn2gK+0gbWA1zyBuj3iada
 IKI16aUVs7hClZF1g624+hDQCEhOhIbApmzMhIX3IugyJOkjf73Alpxq1u+MtbXB1QbxV689L6wQR
 ci8FG0MGPZ4m2u7d9Nis5Mgwq2wjBI26LGSoT9WB1x4wsDBAoqWxO4lrVEUh8bTKnff0SvKSy1Fu9
 bZODj62rBjTrCLl0nkzs01w4pcf5hPbKUKaw04pL1L84DHpCFMZO5zSaxiI9UL8DUYmelJnc18d8s
 dxYK5d+pmLGpCE+Czj43MZha4MWRRMnMXOUB3BzLLa7o43YHV5mRCEqZwXa0Q9zzK6UgJprb7n6Pk
 uri4M/Dg==;
Received: from [2001:4bb8:184:af1:3dc3:9c83:fc6c:e0f] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFgmk-0001Qw-Tu; Tue, 08 Sep 2020 16:47:59 +0000
From: Christoph Hellwig <hch@lst.de>
To: Tony Luck <tony.luck@intel.com>, Fenghua Yu <fenghua.yu@intel.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 iommu@lists.linux-foundation.org
Subject: dma-mapping cleanups
Date: Tue,  8 Sep 2020 18:47:46 +0200
Message-Id: <20200908164758.3177341-1-hch@lst.de>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: linux-ia64@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 Robin Murphy <robin.murphy@arm.com>
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

this series contains just the cleanup parts from the previous
"a saner API for allocating DMA addressable pages" series.  The
intent is to get this in to reduce the amount of patchbombing
for iterations of the real API work.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
