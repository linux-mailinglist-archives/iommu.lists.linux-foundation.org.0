Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F298AEFF7
	for <lists.iommu@lfdr.de>; Tue, 10 Sep 2019 18:52:08 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id AC44AE3A;
	Tue, 10 Sep 2019 16:52:06 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id E1C7FE25
	for <iommu@lists.linux-foundation.org>;
	Tue, 10 Sep 2019 16:52:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 6A8C581A
	for <iommu@lists.linux-foundation.org>;
	Tue, 10 Sep 2019 16:52:05 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F13301000;
	Tue, 10 Sep 2019 09:52:04 -0700 (PDT)
Received: from [10.1.197.57] (e110467-lin.cambridge.arm.com [10.1.197.57])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B2D733F71F;
	Tue, 10 Sep 2019 09:52:00 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] iommu: add support for drivers that manage iommu
	explicitly
To: Rob Clark <robdclark@gmail.com>, Joerg Roedel <joro@8bytes.org>
References: <20190906214409.26677-1-robdclark@gmail.com>
	<20190906214409.26677-2-robdclark@gmail.com>
	<20190910081415.GB3247@8bytes.org>
	<CAF6AEGsFmuO5M_RWm-RjDT_F_1Z=MLYmNqRXqFNDR7aUoPaMdg@mail.gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <4b5b59bb-39a4-0757-e2bb-0961cfc7e4c1@arm.com>
Date: Tue, 10 Sep 2019 17:51:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAF6AEGsFmuO5M_RWm-RjDT_F_1Z=MLYmNqRXqFNDR7aUoPaMdg@mail.gmail.com>
Content-Language: en-GB
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Rob Clark <robdclark@chromium.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Arnd Bergmann <arnd@arndb.de>, Suzuki K Poulose <suzuki.poulose@arm.com>,
	linux-arm-msm <linux-arm-msm@vger.kernel.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	open list <linux-kernel@vger.kernel.org>,
	dri-devel <dri-devel@lists.freedesktop.org>,
	Sudeep Holla <sudeep.holla@arm.com>, iommu@lists.linux-foundation.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Joe Perches <joe@perches.com>, Andrew Morton <akpm@linux-foundation.org>,
	Will Deacon <will@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>
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

On 10/09/2019 16:34, Rob Clark wrote:
> On Tue, Sep 10, 2019 at 1:14 AM Joerg Roedel <joro@8bytes.org> wrote:
>>
>> On Fri, Sep 06, 2019 at 02:44:01PM -0700, Rob Clark wrote:
>>> @@ -674,7 +674,7 @@ int iommu_group_add_device(struct iommu_group *group, struct device *dev)
>>>
>>>        mutex_lock(&group->mutex);
>>>        list_add_tail(&device->list, &group->devices);
>>> -     if (group->domain)
>>> +     if (group->domain && !(dev->driver && dev->driver->driver_manages_iommu))
>>
>> Hmm, this code usually runs at enumeration time when no driver is
>> attached to the device. Actually it would be pretty dangerous when this
>> code runs while a driver is attached to the device. How does that change
>> make things work for you?
>>
> 
> I was seeing this get called via the path driver_probe_device() ->
> platform_dma_configure() -> of_dma_configure() -> of_iommu_configure()
> -> iommu_probe_device() -> ...
> 
> The only cases I was seeing where dev->driver is NULL where a few
> places that drivers call of_dma_configure() on their own sub-devices.
> But maybe there are some other paths that I did not notice?

For the of_iommu flow, it very much depends on your DT layout and driver 
probe order as to whether you catch the "proper" call from 
iommu_bus_notifier()/iommu_bus_init() or the late "replay" from 
of_iommu_configure(). I wouldn't make any assumptions of consistency.

Robin.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
