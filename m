Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id D11427D307
	for <lists.iommu@lfdr.de>; Thu,  1 Aug 2019 04:02:07 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 5796C4310;
	Thu,  1 Aug 2019 02:02:03 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 5F52441C3
	for <iommu@lists.linux-foundation.org>;
	Thu,  1 Aug 2019 01:49:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id A91D65F4
	for <iommu@lists.linux-foundation.org>;
	Thu,  1 Aug 2019 01:49:57 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	31 Jul 2019 18:49:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,332,1559545200"; d="scan'208";a="183988773"
Received: from allen-box.sh.intel.com (HELO [10.239.159.136])
	([10.239.159.136])
	by orsmga002.jf.intel.com with ESMTP; 31 Jul 2019 18:49:54 -0700
Subject: Re: Failure to recreate virtual functions
To: Vlad Buslov <vladbu@mellanox.com>
References: <vbf8sskwyiv.fsf@mellanox.com>
	<d4166595-ec4a-fc4a-3b5f-463b79c42936@linux.intel.com>
	<vbfzhkx9n32.fsf@mellanox.com>
	<838a00c4-d5bd-08db-e39c-5f00686858b5@linux.intel.com>
	<6ece232e-3fe8-4bd9-cd4b-c8d90a106a30@arm.com>
	<abba9e2b-4bd4-bca5-dd50-05ca9ad96d1f@linux.intel.com>
	<vbf36imsb79.fsf@mellanox.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <6c75bf67-cbcd-bded-2a57-9f537fe108c0@linux.intel.com>
Date: Thu, 1 Aug 2019 09:49:12 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <vbf36imsb79.fsf@mellanox.com>
Content-Language: en-US
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Joerg Roedel <jroedel@suse.de>, Ran Rozenstein <ranro@mellanox.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
	Robin Murphy <robin.murphy@arm.com>, Maor Gottlieb <maorg@mellanox.com>
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

Hi,

On 7/31/19 7:19 PM, Vlad Buslov wrote:
> 
> On Wed 31 Jul 2019 at 10:29, Lu Baolu <baolu.lu@linux.intel.com> wrote:
>> Hi,
>>
>> On 7/30/19 7:22 PM, Robin Murphy wrote:
>>> On 30/07/2019 05:28, Lu Baolu wrote:
>>>> Hi,
>>>>
>>>> On 7/29/19 6:05 PM, Vlad Buslov wrote:
>>>>> On Sat 27 Jul 2019 at 05:15, Lu Baolu<baolu.lu@linux.intel.com>  wrote:
>>>>>> Hi Vilad,
>>>>>>
>>>>>> On 7/27/19 12:30 AM, Vlad Buslov wrote:
>>>>>>> Hi Lu Baolu,
>>>>>>>
>>>>>>> Our mlx5 driver fails to recreate VFs when cmdline includes
>>>>>>> "intel_iommu=on iommu=pt" after recent merge of patch set "iommu/vt-d:
>>>>>>> Delegate DMA domain to generic iommu". I've bisected the failure to
>>>>>>> patch b7297783c2bb ("iommu/vt-d: Remove duplicated code for device
>>>>>>> hotplug"). Here is the dmesg log for following case: enable switchdev
>>>>>>> mode, set number of VFs to 0, then set it back to any value
>>>>>>>> 0.
>>>>>>> [  223.525282] mlx5_core 0000:81:00.0: E-Switch: E-Switch enable SRIOV:
>>>>>>> nvfs(2) mode (1)
>>>>>>> [  223.562027] mlx5_core 0000:81:00.0: E-Switch: SRIOV enabled: active
>>>>>>> vports(3)
>>>>>>> [  223.663766] pci 0000:81:00.2: [15b3:101a] type 00 class 0x020000
>>>>>>> [  223.663864] pci 0000:81:00.2: enabling Extended Tags
>>>>>>> [  223.665143] pci 0000:81:00.2: Adding to iommu group 52
>>>>>>> [  223.665215] pci 0000:81:00.2: Using iommu direct mapping
>>>>>>> [  223.665771] mlx5_core 0000:81:00.2: enabling device (0000 -> 0002)
>>>>>>> [  223.665890] mlx5_core 0000:81:00.2: firmware version: 16.26.148
>>>>>>> [  223.889908] mlx5_core 0000:81:00.2: Rate limit: 127 rates are
>>>>>>> supported, range: 0Mbps to 97656Mbps
>>>>>>> [  223.896438] mlx5_core 0000:81:00.2: MLX5E: StrdRq(1) RqSz(8)
>>>>>>> StrdSz(2048) RxCqeCmprss(0)
>>>>>>> [  223.896636] mlx5_core 0000:81:00.2: Assigned random MAC address
>>>>>>> 56:1f:95:e0:51:d6
>>>>>>> [  224.012905] mlx5_core 0000:81:00.2 ens1f0v0: renamed from eth0
>>>>>>> [  224.041651] pci 0000:81:00.3: [15b3:101a] type 00 class 0x020000
>>>>>>> [  224.041711] pci 0000:81:00.3: enabling Extended Tags
>>>>>>> [  224.043660] pci 0000:81:00.3: Adding to iommu group 53
>>>>>>> [  224.043738] pci 0000:81:00.3: Using iommu direct mapping
>>>>>>> [  224.044196] mlx5_core 0000:81:00.3: enabling device (0000 -> 0002)
>>>>>>> [  224.044298] mlx5_core 0000:81:00.3: firmware version: 16.26.148
>>>>>>> [  224.268099] mlx5_core 0000:81:00.3: Rate limit: 127 rates are
>>>>>>> supported, range: 0Mbps to 97656Mbps
>>>>>>> [  224.274983] mlx5_core 0000:81:00.3: MLX5E: StrdRq(1) RqSz(8)
>>>>>>> StrdSz(2048) RxCqeCmprss(0)
>>>>>>> [  224.275195] mlx5_core 0000:81:00.3: Assigned random MAC address
>>>>>>> a6:1e:56:0a:d9:f2
>>>>>>> [  224.388359] mlx5_core 0000:81:00.3 ens1f0v1: renamed from eth0
>>>>>>> [  236.325027] mlx5_core 0000:81:00.0: E-Switch: disable SRIOV: active
>>>>>>> vports(3) mode(1)
>>>>>>> [  236.362766] mlx5_core 0000:81:00.0: E-Switch: E-Switch enable SRIOV:
>>>>>>> nvfs(2) mode (2)
>>>>>>> [  237.290066] mlx5_core 0000:81:00.0: MLX5E: StrdRq(1) RqSz(8)
>>>>>>> StrdSz(2048) RxCqeCmprss(0)
>>>>>>> [  237.350215] mlx5_core 0000:81:00.0: MLX5E: StrdRq(1) RqSz(8)
>>>>>>> StrdSz(2048) RxCqeCmprss(0)
>>>>>>> [  237.373052] mlx5_core 0000:81:00.0 ens1f0: renamed from eth0
>>>>>>> [  237.390768] mlx5_core 0000:81:00.0: MLX5E: StrdRq(1) RqSz(8)
>>>>>>> StrdSz(2048) RxCqeCmprss(0)
>>>>>>> [  237.447846] ens1f0_0: renamed from eth0
>>>>>>> [  237.460399] mlx5_core 0000:81:00.0: E-Switch: SRIOV enabled: active
>>>>>>> vports(3)
>>>>>>> [  237.526880] ens1f0_1: renamed from eth1
>>>>>>> [  248.953873] pci 0000:81:00.2: Removing from iommu group 52
>>>>>>> [  248.954114] pci 0000:81:00.3: Removing from iommu group 53
>>>>>>> [  249.960570] mlx5_core 0000:81:00.0: E-Switch: disable SRIOV: active
>>>>>>> vports(3) mode(2)
>>>>>>> [  250.319135] mlx5_core 0000:81:00.0: MLX5E: StrdRq(1) RqSz(8)
>>>>>>> StrdSz(2048) RxCqeCmprss(0)
>>>>>>> [  250.559431] mlx5_core 0000:81:00.0 ens1f0: renamed from eth0
>>>>>>> [  258.819162] mlx5_core 0000:81:00.0: E-Switch: E-Switch enable SRIOV:
>>>>>>> nvfs(2) mode (1)
>>>>>>> [  258.831625] mlx5_core 0000:81:00.0: E-Switch: SRIOV enabled: active
>>>>>>> vports(3)
>>>>>>> [  258.936160] pci 0000:81:00.2: [15b3:101a] type 00 class 0x020000
>>>>>>> [  258.936258] pci 0000:81:00.2: enabling Extended Tags
>>>>>>> [  258.937438] pci 0000:81:00.2: Failed to add to iommu group 52: -16
>>>>>> It seems that an EBUSY error returned from iommu_group_add_device(). Can
>>>>>> you please hack some debug messages in iommu_group_add_device() so that
>>>>>> we can know where the EBUSY returns?
>>>>>>
>>>>>> Best regards,
>>>>>> Baolu
>>>>> The error code is returned by __iommu_attach_device().
>>>>>
>>>>
>>>> Thanks!
>>>>
>>>> It looks like the system has already a domain for specific pci bdf
>>>> device. Does this VF share the bdf with other devices? Or has been
>>>> previously created, and system failed to get chance to remove it?
>>>
>>> At a glance, it looks like it might be down to intel_iommu_remove_device() not
>>> calling dmar_remove_one_dev_info() like the old notifier did. If the group is
>>> getting torn down and recreated, but the driver still has a stale pointer to
>>> the old default domain cached, which dmar_insert_one_dev_info() finds and
>>> returns, that would seem to explain the observed behaviour.
>>
>> Yes agreed.
>>
>> Vlad,
>>
>> Can you please try below change?
>>
>> diff --git a/drivers/iommu/intel-iommu.c b/drivers/iommu/intel-iommu.c
>> index baf21001c339..abffc520fe05 100644
>> --- a/drivers/iommu/intel-iommu.c
>> +++ b/drivers/iommu/intel-iommu.c
>> @@ -5575,6 +5575,8 @@ static void intel_iommu_remove_device(struct device *dev)
>>          if (!iommu)
>>                  return;
>>
>> +       dmar_remove_one_dev_info(dev);
>> +
>>          iommu_group_remove_device(dev);
>>
>>          iommu_device_unlink(&iommu->iommu, dev);
>>
>> Best regards,
>> Baolu
> 
> Hi Baolu,
> 
> This patch fixes the issue for me.
> 

Great! Thanks for testing. I will submit a fix soon.

Best regards,
Baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
