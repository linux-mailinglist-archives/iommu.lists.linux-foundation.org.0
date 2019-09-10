Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 154BEAE535
	for <lists.iommu@lfdr.de>; Tue, 10 Sep 2019 10:14:22 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id B47BBE77;
	Tue, 10 Sep 2019 08:14:20 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 77A17E6C
	for <iommu@lists.linux-foundation.org>;
	Tue, 10 Sep 2019 08:14:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 1CFEE82B
	for <iommu@lists.linux-foundation.org>;
	Tue, 10 Sep 2019 08:14:19 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
	id 4DC20386; Tue, 10 Sep 2019 10:14:17 +0200 (CEST)
Date: Tue, 10 Sep 2019 10:14:15 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH v2 1/2] iommu: add support for drivers that manage iommu
	explicitly
Message-ID: <20190910081415.GB3247@8bytes.org>
References: <20190906214409.26677-1-robdclark@gmail.com>
	<20190906214409.26677-2-robdclark@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190906214409.26677-2-robdclark@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Rob Clark <robdclark@chromium.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Arnd Bergmann <arnd@arndb.de>, Suzuki K Poulose <suzuki.poulose@arm.com>,
	linux-arm-msm@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Robin Murphy <robin.murphy@arm.com>, dri-devel@lists.freedesktop.org,
	Sudeep Holla <sudeep.holla@arm.com>, iommu@lists.linux-foundation.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Joe Perches <joe@perches.com>, Andrew Morton <akpm@linux-foundation.org>,
	Will Deacon <will@kernel.org>, open list <linux-kernel@vger.kernel.org>
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

On Fri, Sep 06, 2019 at 02:44:01PM -0700, Rob Clark wrote:
> @@ -674,7 +674,7 @@ int iommu_group_add_device(struct iommu_group *group, struct device *dev)
>  
>  	mutex_lock(&group->mutex);
>  	list_add_tail(&device->list, &group->devices);
> -	if (group->domain)
> +	if (group->domain && !(dev->driver && dev->driver->driver_manages_iommu))

Hmm, this code usually runs at enumeration time when no driver is
attached to the device. Actually it would be pretty dangerous when this
code runs while a driver is attached to the device. How does that change
make things work for you?

Regards,

	Joerg

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
