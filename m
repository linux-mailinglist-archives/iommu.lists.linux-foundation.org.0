Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 5483B276C2C
	for <lists.iommu@lfdr.de>; Thu, 24 Sep 2020 10:40:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id E41D9874D9;
	Thu, 24 Sep 2020 08:40:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2JCfNy0dXKDS; Thu, 24 Sep 2020 08:40:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4D36B874D8;
	Thu, 24 Sep 2020 08:40:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 40436C0051;
	Thu, 24 Sep 2020 08:40:23 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F0B78C0051
 for <iommu@lists.linux-foundation.org>; Thu, 24 Sep 2020 08:40:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id E4168874D8
 for <iommu@lists.linux-foundation.org>; Thu, 24 Sep 2020 08:40:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id POcTssMFoTN9 for <iommu@lists.linux-foundation.org>;
 Thu, 24 Sep 2020 08:40:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 94F06874D7
 for <iommu@lists.linux-foundation.org>; Thu, 24 Sep 2020 08:40:20 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id D53C3295; Thu, 24 Sep 2020 10:40:17 +0200 (CEST)
Date: Thu, 24 Sep 2020 10:40:16 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Jacob Pan <jacob.jun.pan@linux.intel.com>
Subject: Re: [PATCH v9 3/7] iommu/uapi: Introduce enum type for PASID data
 format
Message-ID: <20200924084015.GC27174@8bytes.org>
References: <1599861476-53416-1-git-send-email-jacob.jun.pan@linux.intel.com>
 <1599861476-53416-4-git-send-email-jacob.jun.pan@linux.intel.com>
 <20200918094450.GP31590@8bytes.org>
 <20200918101108.672c2f5a@jacob-builder>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200918101108.672c2f5a@jacob-builder>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Jacob Pan <jacob.pan.linux@gmail.com>,
 Raj Ashok <ashok.raj@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 Jean-Philippe Brucker <jean-philippe@linaro.com>,
 iommu@lists.linux-foundation.org, LKML <linux-kernel@vger.kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>, Wu Hao <hao.wu@intel.com>,
 David Woodhouse <dwmw2@infradead.org>, Yi Sun <yi.y.sun@intel.com>
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

Hi Jacob,

On Fri, Sep 18, 2020 at 10:11:08AM -0700, Jacob Pan wrote:
> On Fri, 18 Sep 2020 11:44:50 +0200, Joerg Roedel <joro@8bytes.org> wrote:
> 
> > On Fri, Sep 11, 2020 at 02:57:52PM -0700, Jacob Pan wrote:
> > > There can be multiple vendor-specific PASID data formats used in UAPI
> > > structures. This patch adds enum type with a last entry which makes
> > > range checking much easier.  
> > 
> > But it also makes it much easier to screw up the numbers (which are ABI)
> > by inserting a new value into the middle. I prefer defines here, or
> > alternativly BUILD_BUG_ON() checks for the numbers.
> > 
> I am not following, the purpose of IOMMU_PASID_FORMAT_LAST *is* for
> preparing the future insertion of new value into the middle.
> The checking against IOMMU_PASID_FORMAT_LAST is to protect ABI
> compatibility by making sure that out of range format are rejected in all
> versions of the ABI.

But with the enum you could have:

enum {
	VTD_FOO,
	SMMU_FOO,
	LAST,
};

which makes VTD_FOO==0 and SMMU_FOO==1, and when in the next version
someone adds:

enum {
	VTD_FOO,
	VTD_BAR,
	SMMU_FOO,
	LAST,
};

then SMMU_FOO will become 2 and break ABI. So I'd like to have this
checked somewhere.

Regards,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
