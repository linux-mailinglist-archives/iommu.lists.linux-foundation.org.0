Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id B11F11D3500
	for <lists.iommu@lfdr.de>; Thu, 14 May 2020 17:25:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 68550879C8;
	Thu, 14 May 2020 15:25:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Lx4S4LQtDKQM; Thu, 14 May 2020 15:25:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 500CF868E8;
	Thu, 14 May 2020 15:25:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3E433C016F;
	Thu, 14 May 2020 15:25:42 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9CC2DC016F
 for <iommu@lists.linux-foundation.org>; Thu, 14 May 2020 15:25:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 65F602701D
 for <iommu@lists.linux-foundation.org>; Thu, 14 May 2020 15:25:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jn7HQcqiCUzZ for <iommu@lists.linux-foundation.org>;
 Thu, 14 May 2020 15:25:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by silver.osuosl.org (Postfix) with ESMTPS id 177B12291C
 for <iommu@lists.linux-foundation.org>; Thu, 14 May 2020 15:25:35 +0000 (UTC)
IronPort-SDR: j4aka6cAdawLk6ej/3wxvYuMCgqJFHWn8jcO/TvyDHlCl945HpFbjaWYI5AHpVT/YJoeFcYeRo
 7SJ8mH/Ux6jg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2020 08:25:34 -0700
IronPort-SDR: Ng2hBVYJXHRSIZgay8eUBPE0EZoRJvviZ2qMfzj8FYvf8AGmaHPL90x4D+uUNQg0wv84fsgGmS
 hylSshRCqn8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,391,1583222400"; d="scan'208";a="298071283"
Received: from jacob-builder.jf.intel.com (HELO jacob-builder) ([10.7.199.155])
 by fmsmga002.fm.intel.com with ESMTP; 14 May 2020 08:25:33 -0700
Date: Thu, 14 May 2020 08:31:43 -0700
From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v13 3/8] iommu/vt-d: Add nested translation helper function
Message-ID: <20200514083143.6400d813@jacob-builder>
In-Reply-To: <20200514055424.GC22388@infradead.org>
References: <1589410909-38925-1-git-send-email-jacob.jun.pan@linux.intel.com>
 <1589410909-38925-4-git-send-email-jacob.jun.pan@linux.intel.com>
 <20200514055424.GC22388@infradead.org>
Organization: OTC
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: "Tian, Kevin" <kevin.tian@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>, Raj Ashok <ashok.raj@intel.com>,
 David Woodhouse <dwmw2@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 iommu@lists.linux-foundation.org,
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

On Wed, 13 May 2020 22:54:24 -0700
Christoph Hellwig <hch@infradead.org> wrote:

> > +	 * 1. CPU vs. IOMMU
> > +	 * 2. Guest vs. Host.
> > +	 */
> > +	switch (addr_width) {
> > +#ifdef CONFIG_X86
> > +	case ADDR_WIDTH_5LEVEL:
> > +		if (cpu_feature_enabled(X86_FEATURE_LA57) &&
> > +		    cap_5lp_support(iommu->cap)) {
> > +			pasid_set_flpm(pte, 1);
> > +		} else {
> > +			dev_err_ratelimited(dev, "5-level paging
> > not supported\n");
> > +			return -EINVAL;
> > +		}
> > +		break;  
> 
> The normal style would be to handle the early error return first:
> 
> 		if (!cpu_feature_enabled(X86_FEATURE_LA57) ||
> 		    !cap_5lp_support(iommu->cap)) {
> 			dev_err_ratelimited(dev,
> 				"5-level paging not supported\n");
> 			return -EINVAL;
> 		}
> 
> 		pasid_set_flpm(pte, 1);
> 		break;
> 

Sounds good. I was thinking in positive logic.

thanks
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
