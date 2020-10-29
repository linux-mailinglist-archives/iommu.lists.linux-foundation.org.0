Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 473AB29ED9E
	for <lists.iommu@lfdr.de>; Thu, 29 Oct 2020 14:51:32 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 77F05226FC;
	Thu, 29 Oct 2020 13:51:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7n4PMnZm6MuW; Thu, 29 Oct 2020 13:51:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 397CC2264A;
	Thu, 29 Oct 2020 13:51:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1E44CC0051;
	Thu, 29 Oct 2020 13:51:29 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D1BFAC0051
 for <iommu@lists.linux-foundation.org>; Thu, 29 Oct 2020 13:51:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id BFD27875B7
 for <iommu@lists.linux-foundation.org>; Thu, 29 Oct 2020 13:51:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FIvlf4dYgQMK for <iommu@lists.linux-foundation.org>;
 Thu, 29 Oct 2020 13:51:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by hemlock.osuosl.org (Postfix) with ESMTP id 9901F875B2
 for <iommu@lists.linux-foundation.org>; Thu, 29 Oct 2020 13:51:26 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ED001139F;
 Thu, 29 Oct 2020 06:51:25 -0700 (PDT)
Received: from [10.57.54.223] (unknown [10.57.54.223])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9BDDC3F719;
 Thu, 29 Oct 2020 06:51:24 -0700 (PDT)
Subject: Re: [PATCH] iommu/rockchip: check return value of
 of_find_device_by_node() in rk_iommu_of_xlate()
To: "yukuai (C)" <yukuai3@huawei.com>, joro@8bytes.org, heiko@sntech.de,
 jeffy.chen@rock-chips.com
References: <20201029092202.900218-1-yukuai3@huawei.com>
 <98dec09e-08a1-6550-fa4e-85a8104b90e1@arm.com>
 <35ff5111-1270-fc88-788c-4fb9e38faa85@huawei.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <d5442e6b-2a6b-a8f9-2056-2c0c81e88a01@arm.com>
Date: Thu, 29 Oct 2020 13:51:23 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <35ff5111-1270-fc88-788c-4fb9e38faa85@huawei.com>
Content-Language: en-GB
Cc: linux-rockchip@lists.infradead.org, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 yi.zhang@huawei.com
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

On 2020-10-29 13:19, yukuai (C) wrote:
> 
> On 2020/10/29 18:08, Robin Murphy wrote:
>> On 2020-10-29 09:22, Yu Kuai wrote:
>>> If of_find_device_by_node() failed in rk_iommu_of_xlate(), null pointer
>>> dereference will be triggered. Thus return error code if
>>> of_find_device_by_node() failed.
>>
>> How can that happen? (Given that ".suppress_bind_attrs = true")
>>
>> Robin.
> 
> I'm not sure if that could happen...
> 
> My thought is that it's better to do such checking to aviod any possible
> problem.

->of_xlate() is only invoked on the specific set of ops returned by 
iommu_ops_from_fwnode(). In turn, iommu_ops_from_fwnode() will only 
return those ops if the driver has successfully probed and called 
iommu_register_device() with the relevant DT node. For the driver to 
have been able to probe at all, a platform device associated with that 
DT node must have been created, and therefore of_find_device_by_node() 
cannot fail.

If there ever were some problem serious enough to break that fundamental 
assumption, then I *want* these drivers to crash right here, with a nice 
clear stack trace to start debugging from. So no, I firmly disagree that 
adding redundant code, which will never do anything except attempt to 
paper over catastrophic memory corruption, is "better". Sorry :)

Robin.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
