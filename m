Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D755229E62
	for <lists.iommu@lfdr.de>; Wed, 22 Jul 2020 19:21:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id B70228797A;
	Wed, 22 Jul 2020 17:21:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Mm7-cVluB9gQ; Wed, 22 Jul 2020 17:21:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id B0F6F88359;
	Wed, 22 Jul 2020 17:21:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 97A57C004C;
	Wed, 22 Jul 2020 17:21:31 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 25649C004C
 for <iommu@lists.linux-foundation.org>; Wed, 22 Jul 2020 17:21:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 0D8FE868D9
 for <iommu@lists.linux-foundation.org>; Wed, 22 Jul 2020 17:21:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WynYHfkFp-0o for <iommu@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 17:21:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 1D48E86892
 for <iommu@lists.linux-foundation.org>; Wed, 22 Jul 2020 17:21:28 +0000 (UTC)
IronPort-SDR: Ss761zcUrS8C03h799C+PJql1Pl96P3lk0YfZdAcnJm+CM9yM0PrZzPHbWhQkuNiLIqx3vsvZu
 NtMneLTOWCLQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9690"; a="138471227"
X-IronPort-AV: E=Sophos;i="5.75,383,1589266800"; d="scan'208";a="138471227"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2020 10:21:22 -0700
IronPort-SDR: kb3GPD/NL04hNIlvuFoMEq6vktJwtVn5I98YLypdhtdocLwHYlHIfAQpsnNi7Nsj6nL9eefSeM
 GSIytoBMR73g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,383,1589266800"; d="scan'208";a="270809306"
Received: from romley-ivt3.sc.intel.com ([172.25.110.60])
 by fmsmga007.fm.intel.com with ESMTP; 22 Jul 2020 10:21:21 -0700
Date: Wed, 22 Jul 2020 10:21:21 -0700
From: Fenghua Yu <fenghua.yu@intel.com>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH v6 01/12] iommu: Change type of pasid to u32
Message-ID: <20200722172120.GA75908@romley-ivt3.sc.intel.com>
References: <1594684087-61184-1-git-send-email-fenghua.yu@intel.com>
 <1594684087-61184-2-git-send-email-fenghua.yu@intel.com>
 <20200722140340.GJ27672@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200722140340.GJ27672@8bytes.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Bruce Schlobohm <bruce.schlobohm@intel.com>,
 Peter Zijlstra <peterz@infradead.org>, Dave Hansen <dave.hansen@intel.com>,
 H Peter Anvin <hpa@zytor.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Dave Jiang <dave.jiang@intel.com>, Ashok Raj <ashok.raj@intel.com>,
 x86 <x86@kernel.org>, amd-gfx <amd-gfx@lists.freedesktop.org>,
 Christoph Hellwig <hch@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Ravi V Shankar <ravi.v.shankar@intel.com>, Borislav Petkov <bp@alien8.de>,
 Thomas Gleixner <tglx@linutronix.de>, Tony Luck <tony.luck@intel.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org,
 Jacob Jun Pan <jacob.jun.pan@intel.com>, David Woodhouse <dwmw2@infradead.org>
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

Hi, Joerg,

On Wed, Jul 22, 2020 at 04:03:40PM +0200, Joerg Roedel wrote:
> On Mon, Jul 13, 2020 at 04:47:56PM -0700, Fenghua Yu wrote:
> > PASID is defined as a few different types in iommu including "int",
> > "u32", and "unsigned int". To be consistent and to match with uapi
> > definitions, define PASID and its variations (e.g. max PASID) as "u32".
> > "u32" is also shorter and a little more explicit than "unsigned int".
> > 
> > No PASID type change in uapi although it defines PASID as __u64 in
> > some places.
> > 
> > Suggested-by: Thomas Gleixner <tglx@linutronix.de>
> > Signed-off-by: Fenghua Yu <fenghua.yu@intel.com>
> > Reviewed-by: Tony Luck <tony.luck@intel.com>
> > Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
> > Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>
> 
> For the IOMMU parts:
> 
> Acked-by: Joerg Roedel <jroedel@suse.de>

Thank you!

-Fenghua 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
