Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id D75BD228B02
	for <lists.iommu@lfdr.de>; Tue, 21 Jul 2020 23:19:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 83B1686AE9;
	Tue, 21 Jul 2020 21:19:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SHgBDxbCPWRi; Tue, 21 Jul 2020 21:19:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id CF32486975;
	Tue, 21 Jul 2020 21:19:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9EF0EC016F;
	Tue, 21 Jul 2020 21:19:28 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CDED9C016F
 for <iommu@lists.linux-foundation.org>; Tue, 21 Jul 2020 21:19:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id C4F708746D
 for <iommu@lists.linux-foundation.org>; Tue, 21 Jul 2020 21:19:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JzqEohKVqCQg for <iommu@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:19:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 9D5DE8723E
 for <iommu@lists.linux-foundation.org>; Tue, 21 Jul 2020 21:19:26 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id z15so22488283wrl.8
 for <iommu@lists.linux-foundation.org>; Tue, 21 Jul 2020 14:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=UfaaXDzDLl64kXCbfxTecuzVYPHxG6njBTZ46/VZRxM=;
 b=n/bLLtFLAZABy0+eAqv5JOF0siLIMX2/vEn232R5DlcqQFyZn7yWcCupGfjwFrjnFj
 +XKAfVXj0cAP3iVBoOrZanT86pGRK4bGm+EAf2gzp3ZpmiHYd7R9pmpsaL5PkY/Zu5rm
 mVzQ2P3lOhsSb2+gWBF59GG5sqAIqP/c7qZC9uaFyP8RAZ0dx0uS7xWBmlW0cpl+f1Ep
 DZZGqHn1AXpLNFwzjhphgs9Dy5uahH9CGwiU5NHqx/ZE5Y+8QybFxiD92SrmrF0OM4Qx
 oku75NLri4d2qZrMWwjQmdivpH0rrcyXGkVa8VA8hVukSM19m9f/sBS4WjoFTwHsnaaY
 p9Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UfaaXDzDLl64kXCbfxTecuzVYPHxG6njBTZ46/VZRxM=;
 b=Ao+NkQzyzsWOP/1XjKfFVbAWgdr8EGAnAAK+Wn5fa5IYSGZ9nt87YeE1wYhkLk3kgk
 tTfJ1YIaM4qGm5Iw65YD+xoi5pagSF3/hjc25cV/BLnwvaN/GZGxPBMAJFBr1R4fzZo3
 NpHRQTGBNioWAb0IGrx+oEyfFyeR6XT1tR/gdwtulL6EOKb1GPiAqS9GGfnCKlEXnVcf
 M1kz1fWUrOMSBKYFO8YX3q7stPoFpzw424jv48TbapB8jSKiJI/Nu7a7jVNVItglJ/R8
 ZCIfwNFpvAe+MtbOCsZ64AcqcKwckdYweutKqB5nL6j/7CPGV/MfZyys6E5uEc7lt3DX
 F4AQ==
X-Gm-Message-State: AOAM532W6rPcvnJbrX5uGtNRU4IqA+i8iCp1yNp5/ED1LJ6SxnzQo+bJ
 OLDHZre9ABFKynuyqoY2FBQ=
X-Google-Smtp-Source: ABdhPJxPVerR4H+cxm4UhuSVQZ/RwXNNmjheXMsIFW2MGE/7/bFuLKr9pYd/bXDbTrAFFQT9qQl86g==
X-Received: by 2002:a5d:608f:: with SMTP id w15mr26846749wrt.136.1595366365025; 
 Tue, 21 Jul 2020 14:19:25 -0700 (PDT)
Received: from ziggy.stardust ([213.195.122.158])
 by smtp.gmail.com with ESMTPSA id a123sm5319714wmd.28.2020.07.21.14.19.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jul 2020 14:19:24 -0700 (PDT)
Subject: Re: [PATCH v2] iommu/mediatek: check 4GB mode by reading infracfg
To: Yong Wu <yong.wu@mediatek.com>
References: <20200721021619.25575-1-miles.chen@mediatek.com>
 <cbdd2820-fd3c-3e51-8140-58408dcf3cd3@gmail.com>
 <1595330677.16172.55.camel@mhfsdcap03>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <28bf052f-e388-d300-4abe-38f17bff01b6@gmail.com>
Date: Tue, 21 Jul 2020 23:19:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1595330677.16172.55.camel@mhfsdcap03>
Content-Language: en-US
Cc: Rob Herring <robh@kernel.org>, wsd_upstream@mediatek.com,
 David Hildenbrand <david@redhat.com>, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, Chao Hao <chao.hao@mediatek.com>,
 Miles Chen <miles.chen@mediatek.com>, linux-mediatek@lists.infradead.org,
 Yingjoe Chen <yingjoe.chen@mediatek.com>, Mike Rapoport <rppt@linux.ibm.com>,
 Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org
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



On 21/07/2020 13:24, Yong Wu wrote:
> On Tue, 2020-07-21 at 11:40 +0200, Matthias Brugger wrote:
>>
>> On 21/07/2020 04:16, Miles Chen wrote:
>>> In previous discussion [1] and [2], we found that it is risky to
>>> use max_pfn or totalram_pages to tell if 4GB mode is enabled.
>>>
>>> Check 4GB mode by reading infracfg register, remove the usage
>>> of the un-exported symbol max_pfn.
>>>
>>> This is a step towards building mtk_iommu as a kernel module.
>>>
>>> Change since v1:
>>> 1. remove the phandle usage, search for infracfg instead [3]
>>> 2. use infracfg instead of infracfg_regmap
>>> 3. move infracfg definitaions to linux/soc/mediatek/infracfg.h
>>> 4. update enable_4GB only when has_4gb_mode
>>>
>>> [1] https://lkml.org/lkml/2020/6/3/733
>>> [2] https://lkml.org/lkml/2020/6/4/136
>>> [3] https://lkml.org/lkml/2020/7/15/1147
>>>
>>> Cc: Mike Rapoport <rppt@linux.ibm.com>
>>> Cc: David Hildenbrand <david@redhat.com>
>>> Cc: Yong Wu <yong.wu@mediatek.com>
>>> Cc: Yingjoe Chen <yingjoe.chen@mediatek.com>
>>> Cc: Christoph Hellwig <hch@lst.de>
>>> Cc: Yong Wu <yong.wu@mediatek.com>
>>> Cc: Chao Hao <chao.hao@mediatek.com>
>>> Cc: Rob Herring <robh@kernel.org>
>>> Cc: Matthias Brugger <matthias.bgg@gmail.com>
>>> Signed-off-by: Miles Chen <miles.chen@mediatek.com>
>>> ---
>>>    drivers/iommu/mtk_iommu.c             | 26 +++++++++++++++++++++-----
>>>    include/linux/soc/mediatek/infracfg.h |  3 +++
>>>    2 files changed, 24 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
>>> index 2be96f1cdbd2..16765f532853 100644
>>> --- a/drivers/iommu/mtk_iommu.c
>>> +++ b/drivers/iommu/mtk_iommu.c
>>> @@ -3,7 +3,6 @@
>>>     * Copyright (c) 2015-2016 MediaTek Inc.
>>>     * Author: Yong Wu <yong.wu@mediatek.com>
>>>     */
>>> -#include <linux/memblock.h>
>>>    #include <linux/bug.h>
>>>    #include <linux/clk.h>
>>>    #include <linux/component.h>
>>> @@ -15,13 +14,16 @@
>>>    #include <linux/iommu.h>
>>>    #include <linux/iopoll.h>
>>>    #include <linux/list.h>
>>> +#include <linux/mfd/syscon.h>
>>>    #include <linux/of_address.h>
>>>    #include <linux/of_iommu.h>
>>>    #include <linux/of_irq.h>
>>>    #include <linux/of_platform.h>
>>>    #include <linux/platform_device.h>
>>> +#include <linux/regmap.h>
>>>    #include <linux/slab.h>
>>>    #include <linux/spinlock.h>
>>> +#include <linux/soc/mediatek/infracfg.h>
>>>    #include <asm/barrier.h>
>>>    #include <soc/mediatek/smi.h>
>>>    
>>> @@ -599,8 +601,10 @@ static int mtk_iommu_probe(struct platform_device *pdev)
>>>    	struct resource         *res;
>>>    	resource_size_t		ioaddr;
>>>    	struct component_match  *match = NULL;
>>> +	struct regmap		*infracfg;
>>>    	void                    *protect;
>>>    	int                     i, larb_nr, ret;
>>> +	u32			val;
>>>    
>>>    	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
>>>    	if (!data)
>>> @@ -614,10 +618,22 @@ static int mtk_iommu_probe(struct platform_device *pdev)
>>>    		return -ENOMEM;
>>>    	data->protect_base = ALIGN(virt_to_phys(protect), MTK_PROTECT_PA_ALIGN);
>>>    
>>> -	/* Whether the current dram is over 4GB */
>>> -	data->enable_4GB = !!(max_pfn > (BIT_ULL(32) >> PAGE_SHIFT));
>>> -	if (!data->plat_data->has_4gb_mode)
>>> -		data->enable_4GB = false;
>>> +	data->enable_4GB = false;
>>> +	if (data->plat_data->has_4gb_mode) {
>>> +		infracfg = syscon_regmap_lookup_by_compatible(
>>> +				"mediatek,mt8173-infracfg");
>>> +		if (IS_ERR(infracfg)) {
>>> +			infracfg = syscon_regmap_lookup_by_compatible(
>>> +					"mediatek,mt2712-infracfg");
>>> +			if (IS_ERR(infracfg))
>>> +				return PTR_ERR(infracfg);
>>
>> I think we should check m4u_plat instead to decide which compatible we have to
>> look for.
>> Another option would be to add a general compatible something like
>> "mtk-infracfg" and search for that. That would need an update of all DTS having
>> a infracfg compatible right now. After thinking twice, this would break newer
>> kernel with older device tree, so maybe it's better to go with m4u_plat switch
>> statement.
> 
> Add a "char *infracfg" in the plat_data, Use the mt2712, mt8173
> corresponding string in it. If it is NULL, It means the "enable_4GB"
> always is false. Then we also can remove the flag "has_4gb_mode".
> 
> is this OK?
> 

It's an option, but I personally find that a bit hacky.

Regards,
Matthias
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
