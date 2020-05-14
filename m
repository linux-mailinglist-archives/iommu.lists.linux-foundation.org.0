Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 6911D1D26CD
	for <lists.iommu@lfdr.de>; Thu, 14 May 2020 07:51:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2752687994;
	Thu, 14 May 2020 05:51:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wM-stQZAVXe8; Thu, 14 May 2020 05:51:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id CFE668797C;
	Thu, 14 May 2020 05:51:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C40C5C0890;
	Thu, 14 May 2020 05:51:42 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9F0C6C016F
 for <iommu@lists.linux-foundation.org>; Thu, 14 May 2020 05:51:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 884C388E43
 for <iommu@lists.linux-foundation.org>; Thu, 14 May 2020 05:51:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4qAjdfU75Fx5 for <iommu@lists.linux-foundation.org>;
 Thu, 14 May 2020 05:51:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 19D6788D24
 for <iommu@lists.linux-foundation.org>; Thu, 14 May 2020 05:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=lHQOBRbPUcOA6NMwZdI6zLolOSP00QCntLQdV40Av9E=; b=Px07Vdw5BpOFOzujPzASdTSwFW
 bjuw5xdheRtkq0QEcHGcQqzmfHrO+zwDb8uEXhN5/5kjnBvkrCs3PMFIff20rlMpUH0GR75GZrv0M
 42zdElDOf2GKoOAlEcaK5eiOJM3869hphcggLE384dQe0Tk5wCKFcoXyFrFQdwVDmdiZHgDjPksD/
 jQMk2B9zA6dY6/JNbJiZVj4lEPJM7DrM6gfx3+bfMEeXsnKuEyDZ1fX0JY8eXFLIfEIIF3xlA2sg5
 W0EFzo64gCt+OWNnuV7lMh+r9sUGY5UMqtZpAZH7iBKkGSwm1MjOzUv31lhD6wtXMqEUUWWmiYoSJ
 SVDiaEbg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jZ6mK-0003fq-Ed; Thu, 14 May 2020 05:51:32 +0000
Date: Wed, 13 May 2020 22:51:32 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Jacob Pan <jacob.jun.pan@linux.intel.com>
Subject: Re: [PATCH v13 2/8] iommu/vt-d: Use a helper function to skip agaw
 for SL
Message-ID: <20200514055132.GB22388@infradead.org>
References: <1589410909-38925-1-git-send-email-jacob.jun.pan@linux.intel.com>
 <1589410909-38925-3-git-send-email-jacob.jun.pan@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1589410909-38925-3-git-send-email-jacob.jun.pan@linux.intel.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: "Tian, Kevin" <kevin.tian@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>, Raj Ashok <ashok.raj@intel.com>,
 David Woodhouse <dwmw2@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, iommu@lists.linux-foundation.org,
 Jean-Philippe Brucker <jean-philippe@linaro.com>,
 Jonathan Cameron <jic23@kernel.org>
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

On Wed, May 13, 2020 at 04:01:43PM -0700, Jacob Pan wrote:
> An Intel iommu domain uses 5-level page table by default. If the
> iommu that the domain tries to attach supports less page levels,
> the top level page tables should be skipped. Add a helper to do
> this so that it could be used in other places.

Please use up all 73 chars for the commit log.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
