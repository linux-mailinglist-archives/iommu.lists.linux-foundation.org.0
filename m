Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D23F3125B8
	for <lists.iommu@lfdr.de>; Sun,  7 Feb 2021 17:03:53 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 5599F20440;
	Sun,  7 Feb 2021 16:03:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O1llOI1rkPLv; Sun,  7 Feb 2021 16:03:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 492092043F;
	Sun,  7 Feb 2021 16:03:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 289F5C013A;
	Sun,  7 Feb 2021 16:03:50 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A6BFBC013A
 for <iommu@lists.linux-foundation.org>; Sun,  7 Feb 2021 16:03:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 9215C85A9E
 for <iommu@lists.linux-foundation.org>; Sun,  7 Feb 2021 16:03:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0qFFFgdWteiW for <iommu@lists.linux-foundation.org>;
 Sun,  7 Feb 2021 16:03:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 929B685ABE
 for <iommu@lists.linux-foundation.org>; Sun,  7 Feb 2021 16:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=caubP3x4F2N1fMwvC+jHPhSbeSXCkxkUALBFz4aHrhY=; b=OYsthj5oNsV6Gvobfqu2KBiGzP
 dImcZ0Y5D62EEK/7FFoJNYFuuLou2PpukTOKA+AkOEKO/e8TGkz95H+PR8NcigdVw6wbS5RRDnwKN
 XdXzhWPq5VtxY5LUnzPSamVROIdZS1PhodYNJnH2ucNioNWgjeNWDbgj1p5vx/EmIaTCrn3WGQJR+
 G/xwS1N91tQ3Cf8C3DYLD6ugwFroQ4DaUYsytOsyM5DCvSA7L4apLl0UeplyNlkOllyySbwZM1wru
 kBUBaPAibcsoZGFrw0SXPc5kTGsMap2Dnlu3v10KehJrRJ5IfQeiY0KFzGj9KsMixSIBwHpNTjO6y
 2BMeKgtQ==;
Received: from [2001:4bb8:184:7d04:4590:5583:6cb7:77c7] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1l8mX4-004tMv-Bg; Sun, 07 Feb 2021 16:03:30 +0000
From: Christoph Hellwig <hch@lst.de>
To: jxgao@google.com,
	gregkh@linuxfoundation.org
Subject: preserve DMA offsets when using swiotlb v2
Date: Sun,  7 Feb 2021 17:03:18 +0100
Message-Id: <20210207160327.2955490-1-hch@lst.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: saravanak@google.com, konrad.wilk@oracle.com, marcorr@google.com,
 linux-nvme@lists.infradead.org, kbusch@kernel.org,
 iommu@lists.linux-foundation.org, robin.murphy@arm.com
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

this series make NVMe happy when running with swiotlb.  This caters
towards to completely broken NVMe controllers that ignore the
specification (hello to the biggest cloud provider on the planet!),
to crappy SOC that have addressing limitations, or "secure"
virtualization that force bounce buffering to enhance the user
experience.  Or in other words, no one sane should hit it, but
people do.

It is basically a respin of the

    "SWIOTLB: Preserve swiotlb map offset when needed."

series from Jianxiong Gao.  It complete rewrites the swiotlb part so that
the offset really is preserved and not just the offset into the swiotlb
slot, and to do so it grew half a dozen patches to refactor the swiotlb
so that a mere mortal like me could actually understand it.

Changes since v2:
 - cleanup nr_slots a little more
 - fix a check in get_max_slots
 - add a IO_TLB_SIZE define
 - cleanup find_slots a little more
 - fix the nvme patch to actually compile
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
