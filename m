Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F93B1AC704
	for <lists.iommu@lfdr.de>; Thu, 16 Apr 2020 16:48:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id D984C221F8;
	Thu, 16 Apr 2020 14:39:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1WoByIhQ5a-i; Thu, 16 Apr 2020 14:39:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 36D54221DC;
	Thu, 16 Apr 2020 14:39:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 17EDAC0172;
	Thu, 16 Apr 2020 14:39:11 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9461BC0172
 for <iommu@lists.linux-foundation.org>; Thu, 16 Apr 2020 14:39:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 7DDA384499
 for <iommu@lists.linux-foundation.org>; Thu, 16 Apr 2020 14:39:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xt4SwQGj52A7 for <iommu@lists.linux-foundation.org>;
 Thu, 16 Apr 2020 14:39:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2062.outbound.protection.outlook.com [40.107.20.62])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 0DA6984477
 for <iommu@lists.linux-foundation.org>; Thu, 16 Apr 2020 14:39:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gPIfSK/AMuPaBKKcofA9NOGTMY0DMsV7WAqyqu/8Km/F5+wW2GfnOxK37iV1HNPBeX1yI0GvsMZEp0QcnSOhdv9wkSwImAjMd9hm8nOzEhFboh6WEKDJ8KwURFSyWDngMoVZyWtFF692ywxeL+byg48KL80fzIsNBIwqPmv5r6uKwZYBWVbITij+yiYN1SZ8jtCBRv8hdEAywrRCvTMTvSOBon7PAeRNYsUH1m8SQV51pDJ0ZYYHTuqhu66d5OFmza/hq0GEsWnGer7rQzC/7EWWUi9/zvbgE/jN+YlTQ+GyP2kKkvcdstgYHKbydkCb+timP8SU2ESXIlyDLaje3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mv0L9wisMdrDeZAAW4q1d3+Ep4YUnQEGSJbfPcidB8A=;
 b=G4UCjFsx+ca7elC2aFSlty8LQxHQX5sgSC+9VHZWK8z/lR/1jXYAztJQnD/P7H2cVzrldORz9XQd5DV1E/ymJCWCkz+Ubtd8UwST37mJnXC2xc1v8+UiGveylanesVw2gqISAfMvt86aHRfD2Fw3Pg76kTycEvwxKslhnE4TQegCG2jpJ9zP5372jbkEd7WAkq4Z/+sGZojbaKZ90Gzr9Mt4ugwSpw/6l6IrIz0Zkse0fi+aQEQ177V5CjiznHg9HZKqzO19HNGbAdnO7swZkj4bvKpB6CJWyiFkZ8MGtnSjs9GyzSmZCMo0Dttt2K+LDAU9ulJtWexRZb0ORjTJXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mv0L9wisMdrDeZAAW4q1d3+Ep4YUnQEGSJbfPcidB8A=;
 b=KbG4b23UX8zrNhlfnX2Ntlb2CRcZLZIKCp6k+D1D4xIJf3kM1PGNeUdiONFvs4+OOGW/9S3WFSVwOjLKaS8Zy05YSufmDxQc2aOjz5nqXRjFFG9q190+vphWCVNsTHfy5aQZDbY8jJ6aKAVYTZJAA0Q85VeCXNHGi42Ky5mjFxo=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=laurentiu.tudor@nxp.com; 
Received: from AM6PR04MB5925.eurprd04.prod.outlook.com (2603:10a6:20b:ab::19)
 by AM6PR04MB5173.eurprd04.prod.outlook.com (2603:10a6:20b:d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.26; Thu, 16 Apr
 2020 14:39:02 +0000
Received: from AM6PR04MB5925.eurprd04.prod.outlook.com
 ([fe80::dd71:5f33:1b21:cd9e]) by AM6PR04MB5925.eurprd04.prod.outlook.com
 ([fe80::dd71:5f33:1b21:cd9e%5]) with mapi id 15.20.2900.028; Thu, 16 Apr 2020
 14:39:02 +0000
Subject: Re: [RFC PATCH 1/4] bus: fsl-mc: add custom .dma_configure
 implementation
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
References: <20200227100542.13819-1-laurentiu.tudor@nxp.com>
 <20200325125109.GA5430@red-moon.cambridge.arm.com>
 <499fbf9a-416f-d7c7-0655-881d92138a6c@nxp.com>
 <20200414143211.GA14905@red-moon.cambridge.arm.com>
 <d37ca4e3-58cb-9d6f-3a98-5e4a21ca948b@nxp.com>
 <20200415160425.GA6436@e121166-lin.cambridge.arm.com>
From: Laurentiu Tudor <laurentiu.tudor@nxp.com>
Message-ID: <bd786e30-321a-26b1-dbc5-bc233f89c11b@nxp.com>
Date: Thu, 16 Apr 2020 17:38:56 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
In-Reply-To: <20200415160425.GA6436@e121166-lin.cambridge.arm.com>
Content-Language: en-US
X-ClientProxiedBy: AM0PR06CA0101.eurprd06.prod.outlook.com
 (2603:10a6:208:fa::42) To AM6PR04MB5925.eurprd04.prod.outlook.com
 (2603:10a6:20b:ab::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.107] (86.123.59.151) by
 AM0PR06CA0101.eurprd06.prod.outlook.com (2603:10a6:208:fa::42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2921.25 via Frontend Transport; Thu, 16 Apr 2020 14:38:59 +0000
X-Originating-IP: [86.123.59.151]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d34658d0-2807-4807-ffa1-08d7e213e810
X-MS-TrafficTypeDiagnostic: AM6PR04MB5173:|AM6PR04MB5173:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB5173EAF19513D8155EE26B46ECD80@AM6PR04MB5173.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 0375972289
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR04MB5925.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10009020)(4636009)(376002)(366004)(136003)(396003)(39860400002)(346002)(2906002)(81156014)(316002)(6486002)(478600001)(8676002)(4326008)(31696002)(8936002)(2616005)(36756003)(6666004)(86362001)(6916009)(7416002)(52116002)(44832011)(66556008)(956004)(66476007)(16576012)(66946007)(26005)(31686004)(53546011)(16526019)(5660300002)(186003)(142923001);
 DIR:OUT; SFP:1101; 
Received-SPF: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pZuSikilcFEwzZIUbEH+S6NszKBybxsb9JG4Ck4wEr4dZnHAaXkXUPrRqkbid/Hn7zcvNT5ZVszzTL4JgEs1m2rM4dI0zNPlCR1LiFbFYHfgBI4D0mNM5G/6UrVmIuED30ZtMXa2MIfdzyeQXybanrFydGT7cn50klHe29uvjWVvbJhU0jeHQju5jpbcZBQLzlLpbKijnfAC0ArPObqWfNj2eX5UTYuTt1XWaW/VjlX41Hshubp5lx2mHktvtELs1ixEfYy9ibeFirSjXHnOkfPvP6cv+Z/fiT8tQotNJjVGvTMRcuLf2PFqXphg/aijXCYxe9NqkXHxG+o//M4VCPGGE8i61bA8RgmfbKdxGDVjjkOxC843z+ra0H+9ST9FWE/oNWNbgrXKv4I56GMWl3NGUCxw76tbH2f8mDbaNHl6KKLr9rKi64suT8AeXnqP2GtLuU4y33KaaK+Mjq7SRXbc1EfysQ6cNjrrpwsBiHk6NFguBIV90WD8ieSYQ+5r
X-MS-Exchange-AntiSpam-MessageData: pEKdB/zdcSu9HzeeFwfLURt9TP/f6Hy3Ex6SPuzVDF7MZ7UUSXjArAyB2Hj0UdP+VIEAHh+5bI/k43afraPS+Xm2f3pBVftfPaaYiNa8vEV5vtIb/yeVo4TjUTKsLucThbrVBpImfqltOg7Yku9hoQ==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d34658d0-2807-4807-ffa1-08d7e213e810
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2020 14:39:02.4477 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DMGvykdCt0ATECvepsAlhQ/0U4cNoTtBZ4dtIi9/ZlWFYz5flBD4dY80ruQTCR72b+JRHevjGWN9DYqAtbi18A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5173
Cc: jason@lakedaemon.net, calvin.johnson@nxp.com, ard.biesheuvel@linaro.org,
 maz@kernel.org, pankaj.bansal@nxp.com, diana.craciun@oss.nxp.com,
 jon@solid-run.com, linux-kernel@vger.kernel.org, jeremy.linton@arm.com,
 linux-acpi@vger.kernel.org, iommu@lists.linux-foundation.org,
 cristian.sovaiala@nxp.com, tglx@linutronix.de, makarand.pawagi@nxp.com,
 ioana.ciornei@nxp.com, Stuart.Yoder@arm.com, robin.murphy@arm.com,
 linux-arm-kernel@lists.infradead.org, V.Sethi@nxp.com
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>



On 4/15/2020 7:04 PM, Lorenzo Pieralisi wrote:
> On Wed, Apr 15, 2020 at 06:44:37PM +0300, Laurentiu Tudor wrote:
>>
>>
>> On 4/14/2020 5:32 PM, Lorenzo Pieralisi wrote:
>>> On Wed, Mar 25, 2020 at 06:48:55PM +0200, Laurentiu Tudor wrote:
>>>> Hi Lorenzo,
>>>>
>>>> On 3/25/2020 2:51 PM, Lorenzo Pieralisi wrote:
>>>>> On Thu, Feb 27, 2020 at 12:05:39PM +0200, laurentiu.tudor@nxp.com wrote:
>>>>>> From: Laurentiu Tudor <laurentiu.tudor@nxp.com>
>>>>>>
>>>>>> The devices on this bus are not discovered by way of device tree
>>>>>> but by queries to the firmware. It makes little sense to trick the
>>>>>> generic of layer into thinking that these devices are of related so
>>>>>> that we can get our dma configuration. Instead of doing that, add
>>>>>> our custom dma configuration implementation.
>>>>>>
>>>>>> Signed-off-by: Laurentiu Tudor <laurentiu.tudor@nxp.com>
>>>>>> ---
>>>>>>  drivers/bus/fsl-mc/fsl-mc-bus.c | 31 ++++++++++++++++++++++++++++++-
>>>>>>  1 file changed, 30 insertions(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/drivers/bus/fsl-mc/fsl-mc-bus.c b/drivers/bus/fsl-mc/fsl-mc-bus.c
>>>>>> index 36eb25f82c8e..eafaa0e0b906 100644
>>>>>> --- a/drivers/bus/fsl-mc/fsl-mc-bus.c
>>>>>> +++ b/drivers/bus/fsl-mc/fsl-mc-bus.c
>>>>>> @@ -132,11 +132,40 @@ static int fsl_mc_bus_uevent(struct device *dev, struct kobj_uevent_env *env)
>>>>>>  static int fsl_mc_dma_configure(struct device *dev)
>>>>>>  {
>>>>>>  	struct device *dma_dev = dev;
>>>>>> +	struct iommu_fwspec *fwspec;
>>>>>> +	const struct iommu_ops *iommu_ops;
>>>>>> +	struct fsl_mc_device *mc_dev = to_fsl_mc_device(dev);
>>>>>> +	int ret;
>>>>>> +	u32 icid;
>>>>>>  
>>>>>>  	while (dev_is_fsl_mc(dma_dev))
>>>>>>  		dma_dev = dma_dev->parent;
>>>>>>  
>>>>>> -	return of_dma_configure(dev, dma_dev->of_node, 0);
>>>>>> +	fwspec = dev_iommu_fwspec_get(dma_dev);
>>>>>> +	if (!fwspec)
>>>>>> +		return -ENODEV;
>>>>>> +	iommu_ops = iommu_ops_from_fwnode(fwspec->iommu_fwnode);
>>>>>> +	if (!iommu_ops)
>>>>>> +		return -ENODEV;
>>>>>> +
>>>>>> +	ret = iommu_fwspec_init(dev, fwspec->iommu_fwnode, iommu_ops);
>>>>>> +	if (ret)
>>>>>> +		return ret;
>>>>>> +
>>>>>> +	icid = mc_dev->icid;
>>>>>> +	ret = iommu_fwspec_add_ids(dev, &icid, 1);
>>>>>
>>>>> I see. So with this patch we would use the MC named component only to
>>>>> retrieve the iommu_ops
>>>>
>>>> Right. I'd also add that the implementation tries to follow the existing
>>>> standard .dma_configure implementations, e.g. of_dma_configure +
>>>> of_iommu_configure. I'd also note that similarly to the ACPI case, this
>>>> MC FW device is probed as a platform device in the DT scenario, binding
>>>> here [1].
>>>> A similar approach is used for the retrieval of the msi irq domain, see
>>>> following patch.
>>>>
>>>>> - the streamid are injected directly here bypassing OF/IORT bindings translations altogether. 
>>>>
>>>> Actually I've submitted a v2 [2] that calls into .of_xlate() to allow
>>>> the smmu driver to do some processing on the raw streamid coming from
>>>> the firmware. I have not yet tested this with ACPI but expect it to
>>>> work, however, it's debatable how valid is this approach in the context
>>>> of ACPI.
>>>
>>> Actually, what I think you need is of_map_rid() (and an IORT
>>> equivalent, that I am going to write - generalizing iort_msi_map_rid()).
>>>
>>> Would that be enough to enable IORT "normal" mappings in the MC bus
>>> named components ?
>>>
>>
>> At a first glance, looks like this could very well fix the ACPI
>> scenario, but I have some unclarities on the approach:
>>  * are we going to rely in DT and ACPI generic layers even if these
>> devices are not published / enumerated through DT or ACPI tables?
>>  * the firmware manages and provides discrete streamids for the devices
>> it exposes so there's no translation involved. There's no
>>    requestor_id / input_id involved but it seems that we would still do
>> some kind of translation relying for this on the DT/ACPI functions.
>>  * MC firmware has its own stream_id (e.g. on some chips 0x4000, others
>> 0xf00, so outside the range of stream_ids used for the mc devices)
>>    while for the devices on this bus, MC allocates stream_ids from a
>> range (e.g. 0x17 - 0x3f). Is it possible to describe this in the IORT table?
>>  * Regarding the of_map_rid() use you mentioned, I was planning to
>> decouple the mc bus from the DT layer by dropping the use of
>> of_map_rid(), see patch 4.
>> I briefly glanced over the iort code and spotted this static function:
>> iort_iommu_xlate(). Wouldn't it also help, of course after making it public?
> 
> Guys I have lost you honestly. I don't understand what you really need
> to do with DT and ACPI here. Are they needed to describe what you need
> or not ? If the MC dma configure function does not need any DT/ACPI
> bindings that's fine by me, I don't understand though why you are still
> asking how to represent MC in ACPI then, what for.
> 

Sorry for the stress and all this back and forth. Perhaps it's due to my
lack of understanding why we would need this translation complexity.
We'll return with a proposal in the next spin of the patches so we have
something concrete to discuss on.
---
Thanks & Best Regards, Laurentiu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
