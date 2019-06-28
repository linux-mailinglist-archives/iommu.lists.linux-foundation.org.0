Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D395984F
	for <lists.iommu@lfdr.de>; Fri, 28 Jun 2019 12:25:56 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 8F827C75;
	Fri, 28 Jun 2019 10:25:55 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id CD2AAC6C
	for <iommu@lists.linux-foundation.org>;
	Fri, 28 Jun 2019 10:25:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 55C7F13A
	for <iommu@lists.linux-foundation.org>;
	Fri, 28 Jun 2019 10:25:53 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5SAPcWI097887;
	Fri, 28 Jun 2019 05:25:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1561717538;
	bh=aye3s75eUQHRfwNVawD3d4Wt0X0lPAdttDi3xfWdryE=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=SNbr69eayIlY4i8eJ6qU+BlfwtD30wExXnyio2NB/olPLamGX2SG2Td1GSEpZb/ba
	X7XaUR9bzWEM2JVvHtVjTdQqgDchsksaQXK9XPoxtwq/J9AgqD8c3MpbA4wRji385/
	e18BahuLv9QRwNe5FXlPY/n7sgFmAtIiaH8nkzns=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5SAPcql076046
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 28 Jun 2019 05:25:38 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 28 Jun 2019 05:25:38 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 28 Jun 2019 05:25:37 -0500
Received: from [172.24.190.229] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5SAPY2D051550;
	Fri, 28 Jun 2019 05:25:35 -0500
Subject: Re: [EXTERNAL] Re: [PATCH] iommu/arm-smmu-v3: Fix incorrect fields
	being passed to prefetch command
To: Will Deacon <will@kernel.org>
References: <20190628090953.23606-1-p-yadav1@ti.com>
	<20190628095250.bzq4aqyuczt47y4i@willie-the-truck>
Message-ID: <2341c652-40fe-499a-85a1-d5e28b56657b@ti.com>
Date: Fri, 28 Jun 2019 15:55:56 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190628095250.bzq4aqyuczt47y4i@willie-the-truck>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: lokeshvutla@ti.com, nsekhar@ti.com, linux-kernel@vger.kernel.org,
	iommu@lists.linux-foundation.org, robin.murphy@arm.com,
	wmills@ti.com, linux-arm-kernel@lists.infradead.org
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
From: Pratyush Yadav via iommu <iommu@lists.linux-foundation.org>
Reply-To: Pratyush Yadav <p-yadav1@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org



On 28/06/19 3:22 PM, Will Deacon wrote:
> On Fri, Jun 28, 2019 at 02:39:53PM +0530, Pratyush Yadav wrote:
>> According to the SMMUv3 spec [0] section 4.2.1, command 0x1
>> (CMD_PREFETCH_CONFIG) does not take address and size as parameters. It
>> only takes  StreamID, SSec, SubstreamID, and SSV. Address and Size are
>> parameters for command 0x2 (CMD_PREFETCH_ADDR).
>>
>> Tested on kernel 4.19 on TI J721E SOC.
>>
>> [0] https://static.docs.arm.com/ihi0070/a/IHI_0070A_SMMUv3.pdf
>>
>> Signed-off-by: Pratyush Yadav <p-yadav1@ti.com>
>> ---
>>  drivers/iommu/arm-smmu-v3.c | 7 +++++--
>>  1 file changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/iommu/arm-smmu-v3.c b/drivers/iommu/arm-smmu-v3.c
>> index 4d5a694f02c2..2d4dfd909436 100644
>> --- a/drivers/iommu/arm-smmu-v3.c
>> +++ b/drivers/iommu/arm-smmu-v3.c
>> @@ -413,6 +413,7 @@ struct arm_smmu_cmdq_ent {
>>  	/* Command-specific fields */
>>  	union {
>>  		#define CMDQ_OP_PREFETCH_CFG	0x1
>> +		#define CMDQ_OP_PREFETCH_ADDR	0x2
>>  		struct {
>>  			u32			sid;
>>  			u8			size;
>> @@ -805,10 +806,12 @@ static int arm_smmu_cmdq_build_cmd(u64 *cmd, struct arm_smmu_cmdq_ent *ent)
>>  	case CMDQ_OP_TLBI_EL2_ALL:
>>  	case CMDQ_OP_TLBI_NSNH_ALL:
>>  		break;
>> -	case CMDQ_OP_PREFETCH_CFG:
>> -		cmd[0] |= FIELD_PREP(CMDQ_PREFETCH_0_SID, ent->prefetch.sid);
>> +	case CMDQ_OP_PREFETCH_ADDR:
>>  		cmd[1] |= FIELD_PREP(CMDQ_PREFETCH_1_SIZE, ent->prefetch.size);
>>  		cmd[1] |= ent->prefetch.addr & CMDQ_PREFETCH_1_ADDR_MASK;
>> +		/* Fallthrough */
>> +	case CMDQ_OP_PREFETCH_CFG:
>> +		cmd[0] |= FIELD_PREP(CMDQ_PREFETCH_0_SID, ent->prefetch.sid);
> 
> Hmm, but there's no issue here because the onus is on the caller not to
> initialise size and addr if they are using PREFETCH_CFG (and this is
> currently the case). Are you seeing a problem in practice?

Nope, no problems in practice. I just noticed this discrepancy when
working on something else.

The spec section 4.1.5 says that an implementation can either ignore the
reserved fields or raise CERROR_ILL. The SMMU in our board is kinder and
just ignores those fields, but some other implementations might not.

So if the caller does initialise size and addr, they would either not
take effect or would cause an CERROR_ILL. Either way, not the desired
behaviour.

> I'm happy to take a patch adding support for PREFETCH_ADDR, but we'd need
> a caller first.

I don't have a use case for PREFETCH_ADDR. So how about removing addr
and size for now? It would avoid silent (or not-silent, depending on the
SMMU) failures in the future. If someone wants, they can easily add them
back.

> Also -- fancy sending me a board? ;)

Just as soon as we get some spare ones :)

> Will
> 

-- 
Regards,
Pratyush Yadav
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
