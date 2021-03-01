Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id BB6E932785F
	for <lists.iommu@lfdr.de>; Mon,  1 Mar 2021 08:45:17 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36FA34F289;
	Mon,  1 Mar 2021 07:45:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Nu77MH5JHhlb; Mon,  1 Mar 2021 07:45:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2183C4F285;
	Mon,  1 Mar 2021 07:45:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 00D56C000F;
	Mon,  1 Mar 2021 07:45:15 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A67E6C0001
 for <iommu@lists.linux-foundation.org>; Mon,  1 Mar 2021 07:45:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9A6D04F286
 for <iommu@lists.linux-foundation.org>; Mon,  1 Mar 2021 07:45:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z398vJdVI25b for <iommu@lists.linux-foundation.org>;
 Mon,  1 Mar 2021 07:45:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C47264F285
 for <iommu@lists.linux-foundation.org>; Mon,  1 Mar 2021 07:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=oZQdON2UeZGDjeY8BOuus4h51xz4D0PS1kfJ4kEC/6s=; b=rO8ALAJQqrZEeZ4iEOjPwi1WE+
 6R34dC8dSkDj+qIvIr6UcSiPxULXK+/lCvDQd59+1pjrXB8xmT7INZhQqgIGvc15iyacmBouUpYHq
 Do7OPE+zdqCAtk9VUQgSfWkGNCcxTuVUCNnmCtbqSRZctaKJeHAXhPDtIpyY5e7l26gK4ai4ARYuQ
 OrjO3c1J2ThGSimBb9YbvGnJZi0U/G5QKDNtYkU1CeadFjBoTIqGdPxrVjI5KeB/y+kcasXY76qMt
 ipKwlZlorTKY6C1UI0lpRn30rJKpqd3RD55IINoQG4ssYdZ6Z3/RZxvk8rBrRkpkhd5xp+qwszJTN
 W0EYGG9g==;
Received: from [2001:4bb8:19b:e4b7:cdf9:733f:4874:8eb4] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lGdEK-00FR4S-Vc; Mon, 01 Mar 2021 07:44:43 +0000
From: Christoph Hellwig <hch@lst.de>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: swiotlb cleanups v2
Date: Mon,  1 Mar 2021 08:44:22 +0100
Message-Id: <20210301074436.919889-1-hch@lst.de>
X-Mailer: git-send-email 2.29.2
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

Changes since v1:
 - rebased to v5.12-rc1
 - a few more cleanups
 - merge and forward port the patch from Claire to move all the global
   variables into a struct to prepare for multiple instances
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
