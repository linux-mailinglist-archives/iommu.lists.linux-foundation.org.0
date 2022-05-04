Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 24FF3519E92
	for <lists.iommu@lfdr.de>; Wed,  4 May 2022 13:52:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CDF5B40230;
	Wed,  4 May 2022 11:52:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5BLqruvXPKnS; Wed,  4 May 2022 11:52:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id AB54440227;
	Wed,  4 May 2022 11:52:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 834E7C002D;
	Wed,  4 May 2022 11:52:13 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 21876C002D
 for <iommu@lists.linux-foundation.org>; Wed,  4 May 2022 11:52:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 014AA40218
 for <iommu@lists.linux-foundation.org>; Wed,  4 May 2022 11:52:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Se9vbbPsCR-t for <iommu@lists.linux-foundation.org>;
 Wed,  4 May 2022 11:52:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp4.osuosl.org (Postfix) with ESMTP id C95794021F
 for <iommu@lists.linux-foundation.org>; Wed,  4 May 2022 11:52:10 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2D8121042;
 Wed,  4 May 2022 04:52:10 -0700 (PDT)
Received: from [10.57.80.111] (unknown [10.57.80.111])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E39163FA50;
 Wed,  4 May 2022 04:52:08 -0700 (PDT)
Message-ID: <63c021c4-57de-38fe-e48f-a308088d235b@arm.com>
Date: Wed, 4 May 2022 12:52:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2] drm/tegra: Stop using iommu_present()
Content-Language: en-GB
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>, thierry.reding@gmail.com
References: <1f7c304a79b8b8dd5d4716786cae7502a0cc31f5.1649684782.git.robin.murphy@arm.com>
 <add31812-50d5-6cb0-3908-143c523abd37@collabora.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <add31812-50d5-6cb0-3908-143c523abd37@collabora.com>
Cc: linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
 dri-devel@lists.freedesktop.org, jonathanh@nvidia.com
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On 2022-05-04 01:52, Dmitry Osipenko wrote:
> On 4/11/22 16:46, Robin Murphy wrote:
>> @@ -1092,6 +1092,19 @@ static bool host1x_drm_wants_iommu(struct host1x_device *dev)
>>   	struct host1x *host1x = dev_get_drvdata(dev->dev.parent);
>>   	struct iommu_domain *domain;
>>   
>> +	/* For starters, this is moot if no IOMMU is available */
>> +	if (!device_iommu_mapped(&dev->dev))
>> +		return false;
> 
> Unfortunately this returns false on T30 with enabled IOMMU because we
> don't use IOMMU for Host1x on T30 [1] to optimize performance. We can't
> change it until we will update drivers to support Host1x-dedicated buffers.

Huh, so is dev->dev here not the DRM device? If it is, and 
device_iommu_mapped() returns false, then the later iommu_attach_group() 
call is going to fail anyway, so there's not much point allocating a 
domain. If it's not, then what the heck is host1x_drm_wants_iommu() 
actually testing for?

In the not-too-distant future we'll need to pass an appropriate IOMMU 
client device to iommu_domain_alloc() as well, so the sooner we can get 
this code straight the better.

Thanks,
Robin.

> 
> [1]
> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/host1x/dev.c#L258
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
