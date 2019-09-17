Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8E2B507F
	for <lists.iommu@lfdr.de>; Tue, 17 Sep 2019 16:35:37 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id D3A1E156E;
	Tue, 17 Sep 2019 14:35:35 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id E2D0B1564
	for <iommu@lists.linux-foundation.org>;
	Tue, 17 Sep 2019 14:35:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 2DB4B7DB
	for <iommu@lists.linux-foundation.org>;
	Tue, 17 Sep 2019 14:35:32 +0000 (UTC)
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id 39099E79C2165A46F9FC;
	Tue, 17 Sep 2019 22:35:30 +0800 (CST)
Received: from [127.0.0.1] (10.133.215.186) by DGGEMS410-HUB.china.huawei.com
	(10.3.19.210) with Microsoft SMTP Server id 14.3.439.0;
	Tue, 17 Sep 2019 22:35:29 +0800
Subject: Re: [PATCH v3 0/2] improve the concurrency of
	arm_smmu_atc_inv_domain()
From: "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>
To: Will Deacon <will@kernel.org>
References: <20190823024551.24448-1-thunder.leizhen@huawei.com>
	<20190823075026.pwlx33e4crh3m6tn@willie-the-truck>
	<7e28e1ce-2cc3-3c7f-45c7-e7de334c6976@huawei.com>
Message-ID: <c81257d2-f675-0596-498e-c8a7c391fbdc@huawei.com>
Date: Tue, 17 Sep 2019 22:35:27 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <7e28e1ce-2cc3-3c7f-45c7-e7de334c6976@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.133.215.186]
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
	iommu <iommu@lists.linux-foundation.org>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
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



On 2019/8/23 16:06, Leizhen (ThunderTown) wrote:
> 
> 
> On 2019/8/23 15:50, Will Deacon wrote:
>> On Fri, Aug 23, 2019 at 10:45:49AM +0800, Zhen Lei wrote:
>>> v2 --> v3:
>>> As Will Deacon's suggestion, I changed the lock type of
>>> arm_smmu_domain.devices_lock from spinlock_t to rwlock_t, and I saw that the
>>> performance is all right. And further use nr_ats_masters to quickly check have
>>> no obvious effect, so I drop it.
>>
>> :/
>>
>> I already sent two versions of a series fixing this without any locking at
>> all on the ->unmap() path, and you were on cc. I've also queued that stuff
>> up.
>>
>> Did you not receive my patches?
> Sorry, my message filter setting is a bit wrong, must contains
> "linux-kernel@vger.kernel.org", I have corrected it.
> 
>>
>> v1: https://lists.linuxfoundation.org/pipermail/iommu/2019-August/038306.html
>> v2: https://lists.linuxfoundation.org/pipermail/iommu/2019-August/038374.html
> OK, I will test it when it's my turn to use the board.

The test result shows good to me, without these patches, it's about 22xx-23xx

Jobs: 24 (f=24): [RRRRRRRRRRRRRRRRRRRRRRRR] [0.6% done] [11160M/0K /s] [2725K/0 
Jobs: 24 (f=24): [RRRRRRRRRRRRRRRRRRRRRRRR] [0.6% done] [11165M/0K /s] [2726K/0 
Jobs: 24 (f=24): [RRRRRRRRRRRRRRRRRRRRRRRR] [0.6% done] [11220M/0K /s] [2739K/0 
Jobs: 24 (f=24): [RRRRRRRRRRRRRRRRRRRRRRRR] [0.6% done] [11189M/0K /s] [2732K/0 
Jobs: 24 (f=24): [RRRRRRRRRRRRRRRRRRRRRRRR] [0.6% done] [11082M/0K /s] [2705K/0 
Jobs: 24 (f=24): [RRRRRRRRRRRRRRRRRRRRRRRR] [0.6% done] [11003M/0K /s] [2686K/0 
Jobs: 24 (f=24): [RRRRRRRRRRRRRRRRRRRRRRRR] [0.6% done] [11412M/0K /s] [2786K/0 
Jobs: 24 (f=24): [RRRRRRRRRRRRRRRRRRRRRRRR] [0.6% done] [11415M/0K /s] [2787K/0 
Jobs: 24 (f=24): [RRRRRRRRRRRRRRRRRRRRRRRR] [0.6% done] [11214M/0K /s] [2738K/0 
Jobs: 24 (f=24): [RRRRRRRRRRRRRRRRRRRRRRRR] [0.6% done] [11054M/0K /s] [2699K/0 
Jobs: 24 (f=24): [RRRRRRRRRRRRRRRRRRRRRRRR] [0.6% done] [10733M/0K /s] [2620K/0 
Jobs: 24 (f=24): [RRRRRRRRRRRRRRRRRRRRRRRR] [0.6% done] [10772M/0K /s] [2630K/0 
Jobs: 24 (f=24): [RRRRRRRRRRRRRRRRRRRRRRRR] [0.7% done] [10772M/0K /s] [2630K/0 

> 
>>
>> Queued: https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git/log/?h=for-joerg/arm-smmu/smmu-v3
>>
>> Will
>>
>> .
>>
> 
> _______________________________________________
> iommu mailing list
> iommu@lists.linux-foundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/iommu
> 
> 

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
