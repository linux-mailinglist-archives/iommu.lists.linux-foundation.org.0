Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E1D41C33
	for <lists.iommu@lfdr.de>; Wed, 12 Jun 2019 08:28:22 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 4022C158E;
	Wed, 12 Jun 2019 06:28:20 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 1CD9913E4
	for <iommu@lists.linux-foundation.org>;
	Wed, 12 Jun 2019 06:26:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 806B679
	for <iommu@lists.linux-foundation.org>;
	Wed, 12 Jun 2019 06:26:57 +0000 (UTC)
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id 81C41E146AD85FC4BB65;
	Wed, 12 Jun 2019 14:26:54 +0800 (CST)
Received: from [127.0.0.1] (10.133.215.186) by DGGEMS402-HUB.china.huawei.com
	(10.3.19.202) with Microsoft SMTP Server id 14.3.439.0;
	Wed, 12 Jun 2019 14:26:46 +0800
Subject: Re: [PATCH v8 2/7] x86/dma: use IS_ENABLED() to simplify the code
To: Borislav Petkov <bp@alien8.de>
References: <20190530034831.4184-1-thunder.leizhen@huawei.com>
	<20190530034831.4184-3-thunder.leizhen@huawei.com>
	<20190612051624.GF32652@zn.tnic>
From: "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>
Message-ID: <bd743433-73e9-3cf1-c159-4371abebd989@huawei.com>
Date: Wed, 12 Jun 2019 14:26:43 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190612051624.GF32652@zn.tnic>
Content-Language: en-US
X-Originating-IP: [10.133.215.186]
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: linux-ia64 <linux-ia64@vger.kernel.org>,
	Sebastian Ott <sebott@linux.ibm.com>,
	linux-doc <linux-doc@vger.kernel.org>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Heiko Carstens <heiko.carstens@de.ibm.com>,
	Paul Mackerras <paulus@samba.org>, "H . Peter Anvin" <hpa@zytor.com>,
	linux-s390 <linux-s390@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Jean-Philippe Brucker <jean-philippe.brucker@arm.com>, Michael
	Ellerman <mpe@ellerman.id.au>, x86 <x86@kernel.org>,
	Ingo Molnar <mingo@redhat.com>, Fenghua Yu <fenghua.yu@intel.com>,
	Will Deacon <will.deacon@arm.com>,
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Gerald Schaefer <gerald.schaefer@de.ibm.com>,
	Tony Luck <tony.luck@intel.com>, David Woodhouse <dwmw2@infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	iommu <iommu@lists.linux-foundation.org>,
	Martin Schwidefsky <schwidefsky@de.ibm.com>,
	Robin Murphy <robin.murphy@arm.com>
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



On 2019/6/12 13:16, Borislav Petkov wrote:
> On Thu, May 30, 2019 at 11:48:26AM +0800, Zhen Lei wrote:
>> This patch removes the ifdefs around CONFIG_IOMMU_DEFAULT_PASSTHROUGH to
>> improve readablity.
> 
> Avoid having "This patch" or "This commit" in the commit message. It is
> tautologically useless.

OK, thanks.

> 
> Also, do
> 
> $ git grep 'This patch' Documentation/process
> 
> for more details.
> 
>> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
>> ---
>>  arch/x86/kernel/pci-dma.c | 7 ++-----
>>  1 file changed, 2 insertions(+), 5 deletions(-)
>>
>> diff --git a/arch/x86/kernel/pci-dma.c b/arch/x86/kernel/pci-dma.c
>> index dcd272dbd0a9330..9f2b19c35a060df 100644
>> --- a/arch/x86/kernel/pci-dma.c
>> +++ b/arch/x86/kernel/pci-dma.c
>> @@ -43,11 +43,8 @@
>>   * It is also possible to disable by default in kernel config, and enable with
>>   * iommu=nopt at boot time.
>>   */
>> -#ifdef CONFIG_IOMMU_DEFAULT_PASSTHROUGH
>> -int iommu_pass_through __read_mostly = 1;
>> -#else
>> -int iommu_pass_through __read_mostly;
>> -#endif
>> +int iommu_pass_through __read_mostly =
>> +			IS_ENABLED(CONFIG_IOMMU_DEFAULT_PASSTHROUGH);
> 
> Let that line stick out.

OK, I will merge them on the same line.

> 
> Thx.
> 

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
