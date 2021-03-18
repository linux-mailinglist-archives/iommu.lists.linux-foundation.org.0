Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4E83409E2
	for <lists.iommu@lfdr.de>; Thu, 18 Mar 2021 17:17:19 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 454184ED39;
	Thu, 18 Mar 2021 16:17:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YW1O7yDF2I8u; Thu, 18 Mar 2021 16:17:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id E6A2A4ED86;
	Thu, 18 Mar 2021 16:17:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AA596C0001;
	Thu, 18 Mar 2021 16:17:16 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 81743C0001
 for <iommu@lists.linux-foundation.org>; Thu, 18 Mar 2021 16:17:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6259A60643
 for <iommu@lists.linux-foundation.org>; Thu, 18 Mar 2021 16:17:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MFnMWzu-oBVu for <iommu@lists.linux-foundation.org>;
 Thu, 18 Mar 2021 16:17:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4EF7460616
 for <iommu@lists.linux-foundation.org>; Thu, 18 Mar 2021 16:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=rjzqCoXPd0DSY0h2TMvxPFkgf9ifPYkw6FECGpmC4c0=; b=qrHiJp69lC0mUjzOZxkbiQY1vH
 RjF7mCLDZQnhGmlcLuA8E6EF5g9h6D4/rJfvTDeJHWwXFvMxkh8pUqaX8FJBORDFGleNpyhLUeZqQ
 SR5E3LOLO9UYhbb6RVnJERw+qKRkfMQNTVXPnuPwMl5xO64fuRpLV64sQi6gmft2ANo8rZSNeH8nD
 4zXDTLBX3+xKb34YQR9bPptQ4GcmSQXeHmuwcyO6saX63tq0moDxzj9fhvGF/w/4/5t5rq9XCQy1a
 nQJ66+9c8lGKHcw2CSM56PQynNopNaM20O/Q2h8fhxcqYfEbbvaJeQUICVMs623BlBpww+YoUlPR0
 k5yjh5jg==;
Received: from 089144199244.atnat0008.highway.a1.net ([89.144.199.244]
 helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lMvK6-003Cyb-Sl; Thu, 18 Mar 2021 16:16:40 +0000
From: Christoph Hellwig <hch@lst.de>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: swiotlb cleanups v3
Date: Thu, 18 Mar 2021 17:14:21 +0100
Message-Id: <20210318161424.489045-1-hch@lst.de>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: Michael Ellerman <mpe@ellerman.id.au>, iommu@lists.linux-foundation.org,
 xen-devel@lists.xenproject.org, Claire Chang <tientzu@chromium.org>,
 linuxppc-dev@lists.ozlabs.org, Dongli Zhang <dongli.zhang@oracle.com>
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

Hi Konrad,

this series contains a bunch of swiotlb cleanups, mostly to reduce the
amount of internals exposed to code outside of swiotlb.c, which should
helper to prepare for supporting multiple different bounce buffer pools.

Changes since v2:
 - fix a bisetion hazard that did not allocate the alloc_size array
 - dropped all patches already merged

Changes since v1:
 - rebased to v5.12-rc1
 - a few more cleanups
 - merge and forward port the patch from Claire to move all the global
   variables into a struct to prepare for multiple instances
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
