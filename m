Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A43797A07
	for <lists.iommu@lfdr.de>; Wed, 21 Aug 2019 14:56:29 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 8F08DFE1;
	Wed, 21 Aug 2019 12:56:27 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id F3E14FD7
	for <iommu@lists.linux-foundation.org>;
	Wed, 21 Aug 2019 12:56:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 2344D8A0
	for <iommu@lists.linux-foundation.org>;
	Wed, 21 Aug 2019 12:56:22 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9120F344;
	Wed, 21 Aug 2019 05:56:22 -0700 (PDT)
Received: from [10.1.197.57] (e110467-lin.cambridge.arm.com [10.1.197.57])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BD3CE3F718;
	Wed, 21 Aug 2019 05:56:21 -0700 (PDT)
Subject: Re: [PATCH 3/4] iommu/io-pgtable-arm: Rationalise TCR handling
To: Will Deacon <will@kernel.org>
References: <cover.1566238530.git.robin.murphy@arm.com>
	<78df4f8e2510e88f3ded59eb385f79b4442ed4f2.1566238530.git.robin.murphy@arm.com>
	<20190820103115.o7neehdethf7sbqi@willie-the-truck>
	<48ca6945-de73-116a-3230-84862ca9e60b@arm.com>
	<20190820160700.6ircxomwuo5bksqz@willie-the-truck>
	<8cc47f43-ad74-b4e2-e977-6c78780abc91@arm.com>
	<20190821121120.34wqo7vj56pqk57c@willie-the-truck>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <cdceec32-8dae-2c9e-8f66-0cd86288529f@arm.com>
Date: Wed, 21 Aug 2019 13:56:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190821121120.34wqo7vj56pqk57c@willie-the-truck>
Content-Language: en-GB
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: iommu@lists.linux-foundation.org, linux-arm-kernel@lists.infradead.org
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

On 21/08/2019 13:11, Will Deacon wrote:
> On Tue, Aug 20, 2019 at 07:41:52PM +0100, Robin Murphy wrote:
>> On 20/08/2019 17:07, Will Deacon wrote:
>>> On Tue, Aug 20, 2019 at 04:25:56PM +0100, Robin Murphy wrote:
>>>> On 20/08/2019 11:31, Will Deacon wrote:
>>>>> On Mon, Aug 19, 2019 at 07:19:30PM +0100, Robin Murphy wrote:
>>>>>> Although it's conceptually nice for the io_pgtable_cfg to provide a
>>>>>> standard VMSA TCR value, the reality is that no VMSA-compliant IOMMU
>>>>>> looks exactly like an Arm CPU, and they all have various other TCR
>>>>>> controls which io-pgtable can't be expected to understand. Thus since
>>>>>> there is an expectation that drivers will have to add to the given TCR
>>>>>> value anyway, let's strip it down to just the essentials that are
>>>>>> directly relevant to io-pgatble's inner workings - namely the address
>>>>>> sizes, walk attributes, and where appropriate, format selection.
>>>>>>
>>>>>> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
>>>>>> ---
>>>>>>     drivers/iommu/arm-smmu-v3.c        | 7 +------
>>>>>>     drivers/iommu/arm-smmu.c           | 1 +
>>>>>>     drivers/iommu/arm-smmu.h           | 2 ++
>>>>>>     drivers/iommu/io-pgtable-arm-v7s.c | 6 ++----
>>>>>>     drivers/iommu/io-pgtable-arm.c     | 4 ----
>>>>>>     drivers/iommu/qcom_iommu.c         | 2 +-
>>>>>>     6 files changed, 7 insertions(+), 15 deletions(-)
>>>>>
>>>>> Hmm, so I'm a bit nervous about this one since I think we really should
>>>>> be providing a TCR with EPD1 set if we're only giving you TTBR0. Relying
>>>>> on the driver to do this worries me. See my comments on the next patch.
>>>>
>>>> The whole idea is that we already know we can't provide a *complete* TCR
>>>> value (not least because anything above bit 31 is the wild west), thus
>>>> there's really no point in io-pgtable trying to provide anything other than
>>>> the parts it definitely controls. It makes sense to provide this partial TCR
>>>> value "as if" for TTBR0, since that's the most common case, but ultimately
>>>> io-pgatble doesn't know (or need to) which TTBR the caller intends to
>>>> actually use for this table. Even if the caller *is* allocating it for
>>>> TTBR0, io-pgtable doesn't know that they haven't got something live in TTBR1
>>>> already, so it still wouldn't be in a position to make the EPD1 call either
>>>> way.
>>>
>>> Ok, but the driver can happily rewrite/ignore what it gets back. I suppose
>>> an alternative would be scrapped the 'u64 tcr' and instead having a bunch
>>> of named bitfields for the stuff we're actually providing, although I'd
>>> still like EPDx to be in there.
>>
>> I like the bitfield idea; it would certainly emphasise the "you have to do
>> something more with this" angle that I'm pushing towards here, but still
>> leave things framed in TCR terms without having to go to some more general
>> abstraction. It really doesn't play into your EPD argument though - such a
>> config would be providing TxSZ/TGx/IRGNx/ORGNx/SHx, but EPDy, for y = !x.
>> For a driver to understand that and do the right thing with it is even more
>> involved than for the driver to just set EPD1 by itself anyway.
> 
> Having considered the bitfield idea some more, I'm less attached to EPDx
> because we simply wouldn't be making a statement about them, rather than a
> (dangerous) zero value and expecting it to be ignored. So I think we're in
> agreement on that.

Cool, I'll give bitfields a go for v2.

> The only part I'm still stuck to is that I think io-pgtable should know
> whether it's targetting TTBR0 or TTBR1 so that it can sanitise input
> addresses correctly. Doing this in the driver code is possible, but I'd
> rather not start from that position, particularly as it would require things
> like sign-extension in the TLBI callbacks.

Good point, and thanks for the prod that the way I end up propagating 
masked-off IOVAs through to the TLBI calls here is busted either way. 
I'm OK with introducing an explicit TTBR1 quirk to begin with, as it 
should make things a little easier to reason about, and we can always 
revisit later if and when we do find a need for more flexibility.

>> If only LPAE had created these bits as enables rather than disables then
>> things would be logical and we could all be happy, but here we are...
> 
> I'm happy! :D:D:D

Yeah, but I refuse to believe it's ever because of pagetables ;)

Robin.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
