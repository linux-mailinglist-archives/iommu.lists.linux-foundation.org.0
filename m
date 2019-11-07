Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA64F2AC9
	for <lists.iommu@lfdr.de>; Thu,  7 Nov 2019 10:34:47 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 7DA82DDF;
	Thu,  7 Nov 2019 09:34:42 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 7A242DDD
	for <iommu@lists.linux-foundation.org>;
	Thu,  7 Nov 2019 09:34:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 278E6196
	for <iommu@lists.linux-foundation.org>;
	Thu,  7 Nov 2019 09:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209;
	h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=QG0HO8l7AP0o3zer/F4ohD8xuJyug3fKka00FDeAzM0=;
	b=ZNGbeu4qnZB1J0KjFZ3Uta5jL
	YdCIyJxnDvi75NQZ2GqqFkAaRwrJCfoPJiNz5+OQqAYFrZu+zQCHzskkhvZDE2JZUSEQb/Q+Ct1wF
	5zA2FmfNCHxkDRMv9GgOpTYAeNhJPSGSDjLlZG8FiQLyzo1fulogWDsgAM/r6rpFGfMgUFKrhpHIT
	HGxa8++BbK4QKKUeq1Qo194cOaWGJlyBDuw9e5u+tYyvkvmpi1+XMXL7hGRYQziZDBaSiTWabAAC9
	Z2KxHCEbXiS0I9y4UlyietBfTalAsOOjzrwqHs5iWpM6j9rGKrb8B7ewM/j4CA1b2f2+ruSxtXuFc
	OIifCiKqQ==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1iSeBZ-0001qq-0W; Thu, 07 Nov 2019 09:34:37 +0000
Date: Thu, 7 Nov 2019 01:34:36 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH 1/1] iommu/vt-d: Add Kconfig option to enable/disable
	scalable mode
Message-ID: <20191107093436.GA4342@infradead.org>
References: <20191106051130.485-1-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191106051130.485-1-baolu.lu@linux.intel.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, DOS_RCVD_IP_TWICE_B,
	RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kevin.tian@intel.com, ashok.raj@intel.com, linux-kernel@vger.kernel.org,
	iommu@lists.linux-foundation.org, jacob.jun.pan@intel.com,
	David Woodhouse <dwmw2@infradead.org>
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

On Wed, Nov 06, 2019 at 01:11:30PM +0800, Lu Baolu wrote:
> This adds a Kconfig option INTEL_IOMMU_SCALABLE_MODE_ON to make
> it easier for distributions to enable or disable the Intel IOMMU
> scalable mode during kernel build.



> 
> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
> ---
>  drivers/iommu/Kconfig       | 10 ++++++++++
>  drivers/iommu/intel-iommu.c |  5 +++++
>  2 files changed, 15 insertions(+)
> 
> diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
> index e3842eabcfdd..32f30e27791c 100644
> --- a/drivers/iommu/Kconfig
> +++ b/drivers/iommu/Kconfig
> @@ -242,6 +242,16 @@ config INTEL_IOMMU_FLOPPY_WA
>  	  workaround will setup a 1:1 mapping for the first
>  	  16MiB to make floppy (an ISA device) work.
>  
> +config INTEL_IOMMU_SCALABLE_MODE_ON

That should have a DEFAULT in the name as it is a default.

> +	def_bool n

n is the default default, so this can just be bool.

> +#ifdef CONFIG_INTEL_IOMMU_SCALABLE_MODE_ON
> +int intel_iommu_sm = 1;
> +#else
>  int intel_iommu_sm;
> +#endif /* CONFIG_INTEL_IOMMU_SCALABLE_MODE_ON */

This can use IS_ENABLED().

But then again the distro can just add iommu=sm_on to CONFIG_CMDLINE
and have the same effect, so I don't really get the point of the whole
patch.

Or why we can't just enable it by default for that matter.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
