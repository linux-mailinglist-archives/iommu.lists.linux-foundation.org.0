Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 955E84E593
	for <lists.iommu@lfdr.de>; Fri, 21 Jun 2019 12:10:09 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 528D4E7F;
	Fri, 21 Jun 2019 10:10:07 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 9A151E6C
	for <iommu@lists.linux-foundation.org>;
	Fri, 21 Jun 2019 10:10:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 0A6187DB
	for <iommu@lists.linux-foundation.org>;
	Fri, 21 Jun 2019 10:10:04 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id i11so9352456edq.0
	for <iommu@lists.linux-foundation.org>;
	Fri, 21 Jun 2019 03:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=C9koyYKlbMLhibl2lx9AY0rR+TzAU/XYobZ3xSWkVG0=;
	b=DSUeE//3WukJHugbF/gWy0WiWTZr4N/J86uKbmFZv7vk1neWnFEZeJvbdz67dP86/7
	GEnJQilMXsSM6JjAFtTOksb+xGOuKJx5UVBo1y852aAgDx2l1dIeineE/UX2T4XLoUtM
	c04YQYNT8qvoGTCpbxg2b0X4USgL4pywGSZ8KSPsA+4kcvwD5sbp3Nkd2LN5scy6YrT1
	3aeGgsIme5PHb6alVma33mxEc595yODR+Yz9kDswEUbTa7NxuKaphQs2oXGyYLI0EEVW
	WkuWUihBTu+hd1SlNhz/WUX+ovXBs9SfGpnbHgNR1LBj4930YgHK0Se1SYMrp2g+h5/B
	0Sww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=C9koyYKlbMLhibl2lx9AY0rR+TzAU/XYobZ3xSWkVG0=;
	b=lpwcYx0Kbr7JmGW1WRapOwDTSdZES2hCVTn+dTdasosLwyK1VUxzrQ1UnTTEShEef8
	V2V7p8c7ug9pZ9V7FL8PTbxqNeNTcB+8s9alJaWLlNqpgN0pj/dKSGpwrBgkrQdHIKWQ
	TA86v3DHdZU3tlUIhY0Sw0cE+4LMri4mXNq2Mx4GqVQTsTm+DdDxoSudY+vzb8QPOZCt
	1CjWLAnpa7Y+8eX/kt3ViD8myE+7/Km6mnRFV1ztMrtlYljNZx0qiCKeMFmJfK8YaLpy
	jJUh8rnKi45dcA24c9B81Z6LWHSysQHHHs1TPToJPUA+QT54Y0WZxXMtZelhXYIReUbm
	wfvg==
X-Gm-Message-State: APjAAAW5YCav2j8YNyYBnCY19gBn2AuxIm07RaMqQ7PrZ+flos87CZBQ
	K4ljhrF9Rf394kJQHk5I2kU=
X-Google-Smtp-Source: APXvYqwrkdx4PXYYJwePtSOjSac7NuDGb2bCJemb39H0u+VbRMl4FrNoVs8gUA5RPNsMEswuK0ALQw==
X-Received: by 2002:a50:fb86:: with SMTP id e6mr18747783edq.203.1561111803331; 
	Fri, 21 Jun 2019 03:10:03 -0700 (PDT)
Received: from ziggy.stardust ([37.223.141.54])
	by smtp.gmail.com with ESMTPSA id a3sm346795ejn.64.2019.06.21.03.10.01
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Fri, 21 Jun 2019 03:10:02 -0700 (PDT)
Subject: Re: [PATCH v7 19/21] iommu/mediatek: Rename enable_4GB to dram_is_4gb
To: Yong Wu <yong.wu@mediatek.com>
References: <1560169080-27134-1-git-send-email-yong.wu@mediatek.com>
	<1560169080-27134-20-git-send-email-yong.wu@mediatek.com>
	<9bf13c22-0c73-2950-2204-23d577976b03@gmail.com>
	<1561039192.4021.23.camel@mhfsdcap03>
From: Matthias Brugger <matthias.bgg@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=matthias.bgg@gmail.com; prefer-encrypt=mutual; keydata=
	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
	jrHWeQEI2ucSKsNa8FllDmG/fQ==
Message-ID: <d932ded6-2e1c-f2d1-d3cf-8cb0cdbdbb0d@gmail.com>
Date: Fri, 21 Jun 2019 12:10:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1561039192.4021.23.camel@mhfsdcap03>
Content-Language: en-US
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
	Nicolas Boichat <drinkcat@chromium.org>,
	srv_heupstream@mediatek.com, Will Deacon <will.deacon@arm.com>,
	linux-kernel@vger.kernel.org, Evan Green <evgreen@chromium.org>,
	Tomasz Figa <tfiga@google.com>, iommu@lists.linux-foundation.org,
	Rob Herring <robh+dt@kernel.org>,
	linux-mediatek@lists.infradead.org, yingjoe.chen@mediatek.com,
	anan.sun@mediatek.com, Robin Murphy <robin.murphy@arm.com>,
	Matthias Kaehlcke <mka@chromium.org>, linux-arm-kernel@lists.infradead.org
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



On 20/06/2019 15:59, Yong Wu wrote:
> On Tue, 2019-06-18 at 18:06 +0200, Matthias Brugger wrote:
>>
>> On 10/06/2019 14:17, Yong Wu wrote:
>>> This patch only rename the variable name from enable_4GB to
>>> dram_is_4gb for readable.
>>
>> From my understanding this is true when available RAM > 4GB so I think the name
>> should be something like dram_bigger_4gb otherwise it may create confusion again.
> 
> Strictly, It is not "dram_bigger_4gb". actually if the dram size is over
> 3GB (the first 1GB is the register space), the "4GB mode" will be
> enabled. then how about the name "dram_enable_32bit"?(the PA 32bit will
> be enabled in the 4GB mode.)

Ok I think dram_is_4gb is ok then. But I'd suggest to add an explanation above
the struct mtk_iommu_data to explain exactly what this means.

>      
> There is another option, please see the last part in [1] suggested by
> Evan, something like below:
> ----
> data->enable_4GB = !!(max_pfn > (BIT_ULL(32) >> PAGE_SHIFT));
> if (!data->plat_data->has_4gb_mode)
>     data->enable_4GB = false;
> Then mtk_iommu_map would only have:
>     if (data->enable_4GB)
>          paddr |= BIT_ULL(32);
> ----

I think that's a nicer way to handle it.

Regards,
Matthias

> 
> Which one do you prefer?      
>       
> [1] https://lore.kernel.org/patchwork/patch/1028421/
> 
>>
>> Also from my point of view this patch should be done before
>> "[PATCH 06/21] iommu/io-pgtable-arm-v7s: Extend MediaTek 4GB Mode"
> 
> OK.
> 
>>
>> Regards,
>> Matthias
>>
>>>
>>> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
>>> Reviewed-by: Evan Green <evgreen@chromium.org>
>>> ---
>>>  drivers/iommu/mtk_iommu.c | 10 +++++-----
>>>  drivers/iommu/mtk_iommu.h |  2 +-
>>>  2 files changed, 6 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
>>> index 86158d8..67cab2d 100644
>>> --- a/drivers/iommu/mtk_iommu.c
>>> +++ b/drivers/iommu/mtk_iommu.c
>>> @@ -382,7 +382,7 @@ static int mtk_iommu_map(struct iommu_domain *domain, unsigned long iova,
>>>  	int ret;
>>>  
>>>  	/* The "4GB mode" M4U physically can not use the lower remap of Dram. */
>>> -	if (data->plat_data->has_4gb_mode && data->enable_4GB)
>>> +	if (data->plat_data->has_4gb_mode && data->dram_is_4gb)
>>>  		paddr |= BIT_ULL(32);
>>>  
>>>  	spin_lock_irqsave(&dom->pgtlock, flags);
>>> @@ -554,13 +554,13 @@ static int mtk_iommu_hw_init(const struct mtk_iommu_data *data)
>>>  	writel_relaxed(regval, data->base + REG_MMU_INT_MAIN_CONTROL);
>>>  
>>>  	if (data->plat_data->m4u_plat == M4U_MT8173)
>>> -		regval = (data->protect_base >> 1) | (data->enable_4GB << 31);
>>> +		regval = (data->protect_base >> 1) | (data->dram_is_4gb << 31);
>>>  	else
>>>  		regval = lower_32_bits(data->protect_base) |
>>>  			 upper_32_bits(data->protect_base);
>>>  	writel_relaxed(regval, data->base + REG_MMU_IVRP_PADDR);
>>>  
>>> -	if (data->enable_4GB && data->plat_data->has_vld_pa_rng) {
>>> +	if (data->dram_is_4gb && data->plat_data->has_vld_pa_rng) {
>>>  		/*
>>>  		 * If 4GB mode is enabled, the validate PA range is from
>>>  		 * 0x1_0000_0000 to 0x1_ffff_ffff. here record bit[32:30].
>>> @@ -611,8 +611,8 @@ static int mtk_iommu_probe(struct platform_device *pdev)
>>>  		return -ENOMEM;
>>>  	data->protect_base = ALIGN(virt_to_phys(protect), MTK_PROTECT_PA_ALIGN);
>>>  
>>> -	/* Whether the current dram is over 4GB */
>>> -	data->enable_4GB = !!(max_pfn > (BIT_ULL(32) >> PAGE_SHIFT));
>>> +	/* Whether the current dram is 4GB. */
>>> +	data->dram_is_4gb = !!(max_pfn > (BIT_ULL(32) >> PAGE_SHIFT));
>>>  
>>>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>>>  	data->base = devm_ioremap_resource(dev, res);
>>> diff --git a/drivers/iommu/mtk_iommu.h b/drivers/iommu/mtk_iommu.h
>>> index 753266b..e8114b2 100644
>>> --- a/drivers/iommu/mtk_iommu.h
>>> +++ b/drivers/iommu/mtk_iommu.h
>>> @@ -65,7 +65,7 @@ struct mtk_iommu_data {
>>>  	struct mtk_iommu_domain		*m4u_dom;
>>>  	struct iommu_group		*m4u_group;
>>>  	struct mtk_smi_iommu		smi_imu;      /* SMI larb iommu info */
>>> -	bool                            enable_4GB;
>>> +	bool                            dram_is_4gb;
>>>  	bool				tlb_flush_active;
>>>  
>>>  	struct iommu_device		iommu;
>>>
> 
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
