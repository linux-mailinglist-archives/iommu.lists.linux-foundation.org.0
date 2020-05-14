Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id F0EA71D26D5
	for <lists.iommu@lfdr.de>; Thu, 14 May 2020 07:54:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id A2F3789590;
	Thu, 14 May 2020 05:54:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ztMVrfXF25JE; Thu, 14 May 2020 05:54:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6A20D8958E;
	Thu, 14 May 2020 05:54:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4C853C016F;
	Thu, 14 May 2020 05:54:27 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 83619C016F
 for <iommu@lists.linux-foundation.org>; Thu, 14 May 2020 05:54:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 6B74D87963
 for <iommu@lists.linux-foundation.org>; Thu, 14 May 2020 05:54:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4y85Z-QVKeqh for <iommu@lists.linux-foundation.org>;
 Thu, 14 May 2020 05:54:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 00DBD87949
 for <iommu@lists.linux-foundation.org>; Thu, 14 May 2020 05:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=WVUCicfVAsvxT9MgllLfS1iSzrWh85EnWnC6RBOjG5c=; b=K5wJuD01WQj+Qa7Y/el5mdYWFg
 Dj4XUHbyRLVYVxCA3CRL4vu6+Op8znMzrVbz9RmvFbJ/Nl8/3UnVVL64IgHasmuUEhX6ho6liPmRF
 XAwERUGWpnpuOitYoiVaOtUn7U6p26K4cAf9sOpnEaaCxKhfW/pnzTFinEBfiUYfRsSY+GKD9c/5w
 exGxRZi9C9JdleSUMsoBZ9/vMZmPb3koptQT46Wv+28cLa6Usg7mhlBk50Qsh31vqyjMKQxUfFg8E
 l9fPs3T5NlCXphPUaU3t6f+xb9lcoqB3/D1JuMYPTnO8UOUHgcJDvsjH7UQYhKVTdS2ARZUbYplWy
 GrUmuvdA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jZ6p6-0003pV-59; Thu, 14 May 2020 05:54:24 +0000
Date: Wed, 13 May 2020 22:54:24 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Jacob Pan <jacob.jun.pan@linux.intel.com>
Subject: Re: [PATCH v13 3/8] iommu/vt-d: Add nested translation helper function
Message-ID: <20200514055424.GC22388@infradead.org>
References: <1589410909-38925-1-git-send-email-jacob.jun.pan@linux.intel.com>
 <1589410909-38925-4-git-send-email-jacob.jun.pan@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1589410909-38925-4-git-send-email-jacob.jun.pan@linux.intel.com>
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

> +	 * 1. CPU vs. IOMMU
> +	 * 2. Guest vs. Host.
> +	 */
> +	switch (addr_width) {
> +#ifdef CONFIG_X86
> +	case ADDR_WIDTH_5LEVEL:
> +		if (cpu_feature_enabled(X86_FEATURE_LA57) &&
> +		    cap_5lp_support(iommu->cap)) {
> +			pasid_set_flpm(pte, 1);
> +		} else {
> +			dev_err_ratelimited(dev, "5-level paging not supported\n");
> +			return -EINVAL;
> +		}
> +		break;

The normal style would be to handle the early error return first:

		if (!cpu_feature_enabled(X86_FEATURE_LA57) ||
		    !cap_5lp_support(iommu->cap)) {
			dev_err_ratelimited(dev,
				"5-level paging not supported\n");
			return -EINVAL;
		}

		pasid_set_flpm(pte, 1);
		break;

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
