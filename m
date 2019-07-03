Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4E35E426
	for <lists.iommu@lfdr.de>; Wed,  3 Jul 2019 14:43:05 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 72EDCFDE;
	Wed,  3 Jul 2019 12:43:03 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 6AC95FD9
	for <iommu@lists.linux-foundation.org>;
	Wed,  3 Jul 2019 12:42:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id D7DB4873
	for <iommu@lists.linux-foundation.org>;
	Wed,  3 Jul 2019 12:42:35 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3569A2B;
	Wed,  3 Jul 2019 05:42:35 -0700 (PDT)
Received: from [10.1.197.57] (e110467-lin.cambridge.arm.com [10.1.197.57])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7E1223F703;
	Wed,  3 Jul 2019 05:42:33 -0700 (PDT)
Subject: Re: [PATCH 1/2] iommu: add support for drivers that manage iommu
	explicitly
To: Rob Clark <robdclark@gmail.com>, iommu@lists.linux-foundation.org,
	dri-devel@lists.freedesktop.org
References: <20190702202631.32148-1-robdclark@gmail.com>
	<20190702202631.32148-2-robdclark@gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <2d612bbc-2d2d-f718-1499-79d5a55e0d00@arm.com>
Date: Wed, 3 Jul 2019 13:42:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190702202631.32148-2-robdclark@gmail.com>
Content-Language: en-GB
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Rob Clark <robdclark@chromium.org>, aarch64-laptops@lists.linaro.org,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org,
	Sudeep Holla <sudeep.holla@arm.com>, Joe Perches <joe@perches.com>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

On 02/07/2019 21:26, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Avoid attaching any non-driver managed domain if the driver indicates
> that it manages the iommu directly.
> 
> This solves a couple problems that drm/msm + arm-smmu has with the iommu
> framework:
> 
> 1) In some cases the bootloader takes the iommu out of bypass and
>     enables the display.  This is in particular a problem on the aarch64
>     laptops that exist these days, and modern snapdragon android devices.
>     (Older devices also enabled the display in bootloader but did not
>     take the iommu out of bypass.)  Attaching a DMA or IDENTITY domain
>     while scanout is active, before the driver has a chance to intervene,
>     makes things go *boom*

In the general case, we have to assume that things already went boom 
long ago, as soon as the IOMMU itself was probed and reset. By the time 
we get to the point of binding of a client driver, also assume that the 
IOMMU is already powered off and stopping traffic because the RPM device 
links aren't in place yet and it believes itself unused.

> 2) We are currently blocked on landing support for GPU per-context
>     pagetables because of the domain attached before driver's ->probe()
>     is called.

I'm getting a little fed up of explaining that that problem is specific 
to the current behaviour of one particular IOMMU driver and trying to 
work around it anywhere other than in that driver is at best an 
unreliable hack.

> This solves both problems.

For a very, very specific value of "solve"... ;)

> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   drivers/iommu/iommu.c  | 11 +++++++++++
>   include/linux/device.h |  3 ++-
>   2 files changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index 0c674d80c37f..efa0957f9772 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -1573,6 +1573,17 @@ static int __iommu_attach_device(struct iommu_domain *domain,
>   	    domain->ops->is_attach_deferred(domain, dev))
>   		return 0;
>   
> +	/*
> +	 * If driver is going to manage iommu directly, then avoid
> +	 * attaching any non driver managed domain.  There could
> +	 * be already active dma underway (ie. scanout in case of
> +	 * bootloader enabled display), and interfering with that
> +	 * will make things go *boom*
> +	 */
> +	if ((domain->type != IOMMU_DOMAIN_UNMANAGED) &&
> +	    dev->driver && dev->driver->driver_manages_iommu)
> +		return 0;

This leaving things half-hanging is really ugly, but more than that it 
assumes that allocating a default domain in the first place isn't 
disruptive - I'm not 100% sure that's *always* the case today, and it's 
definitely likely to change in future as part of improving the current 
request_dm_for_dev() mechanism. As it happens, those proposed changes 
would not only break this idea, but make it redundant, since they're 
about forcing the default domain type to passthrough on a per-device 
basis, which leads to an equivalent end result to this patch, but in a 
cleaner and more robust manner.

Robin.

> +
>   	if (unlikely(domain->ops->attach_dev == NULL))
>   		return -ENODEV;
>   
> diff --git a/include/linux/device.h b/include/linux/device.h
> index e138baabe01e..d98aa4d3c8c3 100644
> --- a/include/linux/device.h
> +++ b/include/linux/device.h
> @@ -282,7 +282,8 @@ struct device_driver {
>   	struct module		*owner;
>   	const char		*mod_name;	/* used for built-in modules */
>   
> -	bool suppress_bind_attrs;	/* disables bind/unbind via sysfs */
> +	bool suppress_bind_attrs:1;	/* disables bind/unbind via sysfs */
> +	bool driver_manages_iommu:1;	/* driver manages IOMMU explicitly */
>   	enum probe_type probe_type;
>   
>   	const struct of_device_id	*of_match_table;
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
