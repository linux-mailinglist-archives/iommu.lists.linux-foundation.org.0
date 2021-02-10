Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF593162E5
	for <lists.iommu@lfdr.de>; Wed, 10 Feb 2021 10:56:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9BDC4857CB;
	Wed, 10 Feb 2021 09:56:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bZa01Su_pN-O; Wed, 10 Feb 2021 09:56:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2BD1784F61;
	Wed, 10 Feb 2021 09:56:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F1080C1DA9;
	Wed, 10 Feb 2021 09:56:57 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 04D61C013A
 for <iommu@lists.linux-foundation.org>; Wed, 10 Feb 2021 09:56:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E77746F499
 for <iommu@lists.linux-foundation.org>; Wed, 10 Feb 2021 09:56:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1xJWgPRYicP9 for <iommu@lists.linux-foundation.org>;
 Wed, 10 Feb 2021 09:56:54 +0000 (UTC)
Received: by smtp3.osuosl.org (Postfix, from userid 1001)
 id 379DA6F4A4; Wed, 10 Feb 2021 09:56:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F07546F499
 for <iommu@lists.linux-foundation.org>; Wed, 10 Feb 2021 09:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=BrUYSTaTW1e8xfs22Uv2txfuMyOzowe0x7y8KWioAkI=; b=objhhjPX/Ddcl19rnluY4m3wtU
 s1nu7oXVypTcGWPEhqSLqA2ftEA5iw4zbHgl7M8BxmplY9sUVubNj2iYzimdWnt2zYYsCwhkPR96O
 NOyj4Jzbp+11KAFQi1lGSqrfw1FDpKGwX9jVggi9UZ6zFfoJKQGeRIEKGjXDpUHsNutenkaIth/Jk
 AW9WvvrjCIGx9QzdFdJ22hY3idFBCr2AEl9iBHwJqJCwAr5K1Q3UKUxHqK4d/2NOA/IqGX/PWGsvB
 wEz8RYWS52Q5lWApiySaofRWOhaB5If/ixDGOCetc4cgB/QPWTuyoujq3KYrsqVOY69rIZ+Mc7bUC
 F7q7az8g==;
Received: from [2001:4bb8:184:7d04:5e70:671e:7b3:191] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1l9mEl-008g47-L1; Wed, 10 Feb 2021 09:56:44 +0000
From: Christoph Hellwig <hch@lst.de>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: MIPS noncoherent DMA cleanups v2
Date: Wed, 10 Feb 2021 10:56:35 +0100
Message-Id: <20210210095641.23856-1-hch@lst.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: iommu@lists.linux-foundation.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org
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

Hi Thomas,

this series cleans up some of the mips (maybe) noncoherent support.
It also remove the need for the special <asm/dma-coherence.h> header only
provided by mips.

Changes since v1:
 - fix a bisection issue due to a missing brace
 - simplify the parameter parsing given that it happens after
   plat_mem_init
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
