Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id B79C41A7C0D
	for <lists.iommu@lfdr.de>; Tue, 14 Apr 2020 15:14:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6B01185BA9;
	Tue, 14 Apr 2020 13:14:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nIyCI3kLw8YC; Tue, 14 Apr 2020 13:14:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id EC660861E7;
	Tue, 14 Apr 2020 13:14:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D4DDAC0172;
	Tue, 14 Apr 2020 13:14:21 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4D574C0172
 for <iommu@lists.linux-foundation.org>; Tue, 14 Apr 2020 13:14:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 3A5C686E1D
 for <iommu@lists.linux-foundation.org>; Tue, 14 Apr 2020 13:14:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w6fVAXN7xjJr for <iommu@lists.linux-foundation.org>;
 Tue, 14 Apr 2020 13:14:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 18D7686DF0
 for <iommu@lists.linux-foundation.org>; Tue, 14 Apr 2020 13:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=s9wO1kktwKhWfxkNKBlR4BadnfNxuXVCWsOuMusKhWU=; b=rg2UNX+oDOoOmlIrOoATZfvHJo
 yXYLxsNWr2T1nJZrGxGk5Lv5RIM+MPtFqTLpUBL+OtQmXF3dvx+r/E34dM9LM/msmhlhCadHxgEIS
 pWLlsjvDOXkWGefwhB3ab1TbSjUnXSZ4O+DhmchdWfxHMd4ltbCqfxvArHED4bAzh+LrU5N0g8RQ/
 sMGiG1d5h+8y+YZLDA1ZDHHjyY6lnNQFIUnXfoqPK7R0pAFuXPpCBcPa9tHT3OZrp88howxBXTV4j
 g8suig+TIKVixAxTM0KrW7filVEfIW9iQoItZ9Ea9AdgUOMqiNFBCHWAFRBbLBwX140HeueDrEM53
 qriivVXQ==;
Received: from [2001:4bb8:180:384b:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jOLNu-0006Fe-Le; Tue, 14 Apr 2020 13:13:54 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Stephen Hemminger <sthemmin@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 x86@kernel.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Laura Abbott <labbott@redhat.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Minchan Kim <minchan@kernel.org>, Nitin Gupta <ngupta@vflare.org>
Subject: decruft the vmalloc API v2
Date: Tue, 14 Apr 2020 15:13:19 +0200
Message-Id: <20200414131348.444715-1-hch@lst.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: Christophe Leroy <christophe.leroy@c-s.fr>, linux-arch@vger.kernel.org,
 linux-hyperv@vger.kernel.org, linux-s390@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-mm@kvack.org,
 iommu@lists.linux-foundation.org, bpf@vger.kernel.org,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
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

Peter noticed that with some dumb luck you can toast the kernel address
space with exported vmalloc symbols.

I used this as an opportunity to decruft the vmalloc.c API and make it
much more systematic.  This also removes any chance to create vmalloc
mappings outside the designated areas or using executable permissions
from modules.  Besides that it removes more than 300 lines of code.

A git tree is also available here:

    git://git.infradead.org/users/hch/misc.git sanitize-vmalloc-api.2

Gitweb:

    http://git.infradead.org/users/hch/misc.git/shortlog/refs/heads/sanitize-vmalloc-api.2

Changes since v1:
 - implement pgprot_nx for arm64 (Mark Rutland)
 - fix a patch description
 - properly pass pgprot to vmap in ion
 - add a new patch to fix vmap() API misuse
 - fix a vmap argument in x86
 - two more vmalloc cleanups
 - cleanup use of the unmap_kernel_range API
 - rename ioremap_pbh to ioremap_phb
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
