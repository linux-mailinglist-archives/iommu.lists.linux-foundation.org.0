Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A107025A
	for <lists.iommu@lfdr.de>; Mon, 22 Jul 2019 16:28:48 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 6FAC6BDC;
	Mon, 22 Jul 2019 14:28:46 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 9987EA7A
	for <iommu@lists.linux-foundation.org>;
	Mon, 22 Jul 2019 14:28:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 3EDF8892
	for <iommu@lists.linux-foundation.org>;
	Mon, 22 Jul 2019 14:28:37 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
	id E226C1F2; Mon, 22 Jul 2019 16:28:34 +0200 (CEST)
Date: Mon, 22 Jul 2019 16:28:33 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH v2] iommu: add support for drivers that manage iommu
	explicitly
Message-ID: <20190722142833.GB12009@8bytes.org>
References: <20190702202631.32148-2-robdclark@gmail.com>
	<20190710182844.25032-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190710182844.25032-1-robdclark@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=unavailable version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Rob Clark <robdclark@chromium.org>, aarch64-laptops@lists.linaro.org,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Robin Murphy <robin.murphy@arm.com>, Sudeep Holla <sudeep.holla@arm.com>,
	iommu@lists.linux-foundation.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Joe Perches <joe@perches.com>, Andrew Morton <akpm@linux-foundation.org>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
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

On Wed, Jul 10, 2019 at 11:28:30AM -0700, Rob Clark wrote:
> --- a/include/linux/device.h
> +++ b/include/linux/device.h
> @@ -282,7 +282,8 @@ struct device_driver {
>  	struct module		*owner;
>  	const char		*mod_name;	/* used for built-in modules */
>  
> -	bool suppress_bind_attrs;	/* disables bind/unbind via sysfs */
> +	bool suppress_bind_attrs:1;	/* disables bind/unbind via sysfs */
> +	bool driver_manages_iommu:1;	/* driver manages IOMMU explicitly */

Who will set this bit?


Regards,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
