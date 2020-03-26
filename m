Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id BDBD5193BBB
	for <lists.iommu@lfdr.de>; Thu, 26 Mar 2020 10:23:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6E0A58846A;
	Thu, 26 Mar 2020 09:23:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PlJy9GOUMryh; Thu, 26 Mar 2020 09:23:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 08A138844A;
	Thu, 26 Mar 2020 09:23:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EAFF2C1831;
	Thu, 26 Mar 2020 09:23:38 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 94A45C0177
 for <iommu@lists.linux-foundation.org>; Thu, 26 Mar 2020 09:23:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 8B5A885552
 for <iommu@lists.linux-foundation.org>; Thu, 26 Mar 2020 09:23:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mudy17cUAPnE for <iommu@lists.linux-foundation.org>;
 Thu, 26 Mar 2020 09:23:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 0B437850D6
 for <iommu@lists.linux-foundation.org>; Thu, 26 Mar 2020 09:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=SJ7pKkFmOx4wZcVtsAMqTLL+aY8+TznGxguEO/eMcF8=; b=rraUU7pKT8SQVUhoAACLX9Iy0L
 8ucSnvQs55LudOn8+d/KB0VLh3mfZl8JpOKRTFvlMC4qC3eZnWKZY4cmCY/SUbikGBf9w4mFt8gmi
 SiT16HNVVvWtH7w7sIW+CnNZIJSdUQbYOYIjyBL8+Gv4Sxq7xozcS/ui1iZOhMk4YTeh94OtWoS2I
 QvLTvMaIr7zLuSp9EA6m3G8LX2NRRNpQzOkbk0ze2y+MAx1a0z033F5LPSuHgyFqJfeExCBWgJ8PW
 EectoCcGNpjguntiCu7KVuf7P05mlWIGk0LaT4bviMu/epED+rn3qB6zpjh118scTWkfyzY5jRtDg
 32DDZiwQ==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jHOjM-0008Nc-Q3; Thu, 26 Mar 2020 09:23:16 +0000
Date: Thu, 26 Mar 2020 02:23:16 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Jacob Pan <jacob.jun.pan@linux.intel.com>
Subject: Re: [PATCH v2 1/3] iommu/uapi: Define uapi version and capabilities
Message-ID: <20200326092316.GA31648@infradead.org>
References: <1585178227-17061-1-git-send-email-jacob.jun.pan@linux.intel.com>
 <1585178227-17061-2-git-send-email-jacob.jun.pan@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1585178227-17061-2-git-send-email-jacob.jun.pan@linux.intel.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Raj Ashok <ashok.raj@intel.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.com>,
 LKML <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org,
 Alex Williamson <alex.williamson@redhat.com>,
 David Woodhouse <dwmw2@infradead.org>
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

On Wed, Mar 25, 2020 at 04:17:05PM -0700, Jacob Pan wrote:
> Having a single UAPI version to govern the user-kernel data structures
> makes compatibility check straightforward. On the contrary, supporting
> combinations of multiple versions of the data can be a nightmare to
> maintain.
> 
> This patch defines a unified UAPI version to be used for compatibility
> checks between user and kernel.

This is bullshit.  Version numbers don't scale and we've avoided them
everywhere.  You need need flags specifying specific behavior.

> +#define IOMMU_UAPI_VERSION	1
> +static inline int iommu_get_uapi_version(void)
> +{
> +	return IOMMU_UAPI_VERSION;
> +}

Also inline functions like this in UAPI headers that actually get
included by userspace programs simply don't work.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
