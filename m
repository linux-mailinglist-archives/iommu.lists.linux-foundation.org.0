Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id A3DCE4A4728
	for <lists.iommu@lfdr.de>; Mon, 31 Jan 2022 13:30:00 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 443B860EAD;
	Mon, 31 Jan 2022 12:29:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g-IM_KEgaY0z; Mon, 31 Jan 2022 12:29:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 2A70A60E8A;
	Mon, 31 Jan 2022 12:29:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E8FAAC000B;
	Mon, 31 Jan 2022 12:29:57 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E6406C000B
 for <iommu@lists.linux-foundation.org>; Mon, 31 Jan 2022 12:29:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CD9EE828A9
 for <iommu@lists.linux-foundation.org>; Mon, 31 Jan 2022 12:29:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r0aLaqbNKS8a for <iommu@lists.linux-foundation.org>;
 Mon, 31 Jan 2022 12:29:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B98FA82871
 for <iommu@lists.linux-foundation.org>; Mon, 31 Jan 2022 12:29:55 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id u15so25122618wrt.3
 for <iommu@lists.linux-foundation.org>; Mon, 31 Jan 2022 04:29:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=XfDEtvQ/tzVD1YeBowq1DH94HINF3JBGxRgfDDz4P9Q=;
 b=W4NHjEA+9XVVL8xz6qTEqQvruINpNG1pl5p/yaTwPsUbqDWoTdwk6B90cytFkMTHZT
 lrQuJGMCrkrs3FC5BaobUmorxlxni/0C26+D4VsSXYqKlUY8Ar8xiHI3b74c2sMVkTLU
 gSKadOZdH4vnOVfaH7dEpE2s9zlDj36v/3eMYHeSfAyUcZJ1HDwwiM1nyWsQnV4O0yRb
 O1xd+UqJM3rUINASsACdI5OKMhaHlXLsyvVO9ERwrZUlIgIG7kIn8nF6cUlGtvVMzycp
 83qu/fIP/2WVZAxPlTcZxmh9pHc3byTUiIOGNQbWxrf5VMQI0tURoHxAzof9DE6mx1vg
 FIAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=XfDEtvQ/tzVD1YeBowq1DH94HINF3JBGxRgfDDz4P9Q=;
 b=vQDRWVprjocN/IdO61pEJ8ob8A55OBPOrekhtWgAMQl7pRrRUaBY73/arB3BiZka19
 jtLgtSFkpUFWM1/b/fUNV3TRckantdpYogF10bVqb2MRPpJnmbAEHtlWar+nTfkZXBfK
 41c9joOBCvWDHQvCkrTbx13iJZGdKaeH4R2z+gNJovtDEwUicpx5tRbxqPp2Tx9MB39H
 QpaD/EIzkBxe5T/+adS23QoZwcyE3D4cJBE+9+38WpbY3yjdR+M8WciUV2tsthh8I7vC
 8OxhzaQ1PcQ4k/dXo+ipMu94AayCdRerdm/wIQ89R3z2GjZ1Iw1gc/03Sc2zT1fs7lQc
 KlFQ==
X-Gm-Message-State: AOAM533OMespKvZAC9Ex+4bkp1dr+ceuj1kO1xuDSs3nfTqgmlFtukTi
 6QbvzOfr+F7fY+Av9T6sDTk=
X-Google-Smtp-Source: ABdhPJwKPAOlfE8A7dNEWpNDKJVV/rApo0lar6YbP+IVu/WUEb/GzeZxyimip5vdiaqDYs3eC4tjRQ==
X-Received: by 2002:a05:6000:1548:: with SMTP id
 8mr16792438wry.504.1643632193762; 
 Mon, 31 Jan 2022 04:29:53 -0800 (PST)
Received: from [192.168.0.14] ([37.223.145.74])
 by smtp.gmail.com with ESMTPSA id m12sm13729547wrp.61.2022.01.31.04.29.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Jan 2022 04:29:53 -0800 (PST)
Message-ID: <5991ad51-4181-d445-284c-386447cffb95@gmail.com>
Date: Mon, 31 Jan 2022 13:29:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v10 02/13] iommu/mediatek-v1: Free the existed fwspec if
 the master dev already has
Content-Language: en-US
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Yong Wu <yong.wu@mediatek.com>
References: <20220117070510.17642-1-yong.wu@mediatek.com>
 <20220117070510.17642-3-yong.wu@mediatek.com>
 <20220128134055.720bb43c@coco.lan> <20220128134540.00c6c380@coco.lan>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220128134540.00c6c380@coco.lan>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@linux.ie>,
 Will Deacon <will.deacon@arm.com>, dri-devel@lists.freedesktop.org,
 yf.wang@mediatek.com, Hans Verkuil <hverkuil@xs4all.nl>,
 anthony.huang@mediatek.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Evan Green <evgreen@chromium.org>, Eizan Miyamoto <eizan@chromium.org>,
 Matthias Kaehlcke <mka@chromium.org>, mingyuan.ma@mediatek.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 Joerg Roedel <jroedel@suse.de>, Philipp Zabel <p.zabel@pengutronix.de>,
 Frank Wunderlich <frank-w@public-files.de>, libo.kang@mediatek.com,
 yi.kuo@mediatek.com, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 Tiffany Lin <tiffany.lin@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 anan.sun@mediatek.com, srv_heupstream@mediatek.com, acourbot@chromium.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Daniel Vetter <daniel@ffwll.ch>, Robin Murphy <robin.murphy@arm.com>
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



On 28/01/2022 13:45, Mauro Carvalho Chehab wrote:
> Em Fri, 28 Jan 2022 13:40:55 +0100
> Mauro Carvalho Chehab <mchehab@kernel.org> escreveu:
> 
>> Hi Matthias/Yong,
>>
>> Are you ok if this patch gets merged via the media tree together with the
>> remaining series, or do you prefer to apply it via SoC tree instead?
> 
> Same questions for other patches touching files outside drivers/media
> on this pull request:
> 
> 	https://patchwork.kernel.org/project/linux-mediatek/patch/7af52d61-47c7-581d-62ed-76a7f8315b16@xs4all.nl/
> 

Looks good to me.

Please let me know once you accepted the pull request and I'll queue the DTS 
related changes from this series.

Regards,
Matthias

> Like those:
> 	0004-0013-iommu-mediatek-v1-Free-the-existed-fwspec-if-the-mas.patch
> 	0005-0013-iommu-mediatek-Return-ENODEV-if-the-device-is-NULL.patch
> 	0006-0013-iommu-mediatek-Add-probe_defer-for-smi-larb.patch
> 	0007-0013-iommu-mediatek-Add-device_link-between-the-consumer-.patch
> 
> Regards,
> Mauro
> 
>>
>> Regards,
>> Mauro
>>
>>
>> Em Mon, 17 Jan 2022 15:04:59 +0800
>> Yong Wu <yong.wu@mediatek.com> escreveu:
>>
>>> When the iommu master device enters of_iommu_xlate, the ops may be
>>> NULL(iommu dev is defered), then it will initialize the fwspec here:
>>>
>>> [<c0c9c5bc>] (dev_iommu_fwspec_set) from [<c06bda80>]
>>> (iommu_fwspec_init+0xbc/0xd4)
>>> [<c06bd9c4>] (iommu_fwspec_init) from [<c06c0db4>]
>>> (of_iommu_xlate+0x7c/0x12c)
>>> [<c06c0d38>] (of_iommu_xlate) from [<c06c10e8>]
>>> (of_iommu_configure+0x144/0x1e8)
>>>
>>> BUT the mtk_iommu_v1.c only supports arm32, the probing flow still is a bit
>>> weird. We always expect create the fwspec internally. otherwise it will
>>> enter here and return fail.
>>>
>>> static int mtk_iommu_create_mapping(struct device *dev,
>>> 				    struct of_phandle_args *args)
>>> {
>>>          ...
>>> 	if (!fwspec) {
>>> 	        ....
>>> 	} else if (dev_iommu_fwspec_get(dev)->ops != &mtk_iommu_ops) {
>>>                  >>>>>>>>>>Enter here. return fail.<<<<<<<<<<<<
>>> 		return -EINVAL;
>>> 	}
>>> 	...
>>> }
>>>
>>> Thus, Free the existed fwspec if the master device already has fwspec.
>>>
>>> This issue is reported at:
>>> https://lore.kernel.org/linux-mediatek/trinity-7d9ebdc9-4849-4d93-bfb5-429dcb4ee449-1626253158870@3c-app-gmx-bs01/
>>>
>>> Reported-by: Frank Wunderlich <frank-w@public-files.de>
>>> Tested-by: Frank Wunderlich <frank-w@public-files.de> # BPI-R2/MT7623
>>> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
>>> Acked-by: Joerg Roedel <jroedel@suse.de>
>>> Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>> ---
>>>   drivers/iommu/mtk_iommu_v1.c | 9 +++++++++
>>>   1 file changed, 9 insertions(+)
>>>
>>> diff --git a/drivers/iommu/mtk_iommu_v1.c b/drivers/iommu/mtk_iommu_v1.c
>>> index be22fcf988ce..1467ba1e4417 100644
>>> --- a/drivers/iommu/mtk_iommu_v1.c
>>> +++ b/drivers/iommu/mtk_iommu_v1.c
>>> @@ -425,6 +425,15 @@ static struct iommu_device *mtk_iommu_probe_device(struct device *dev)
>>>   	struct mtk_iommu_data *data;
>>>   	int err, idx = 0;
>>>   
>>> +	/*
>>> +	 * In the deferred case, free the existed fwspec.
>>> +	 * Always initialize the fwspec internally.
>>> +	 */
>>> +	if (fwspec) {
>>> +		iommu_fwspec_free(dev);
>>> +		fwspec = dev_iommu_fwspec_get(dev);
>>> +	}
>>> +
>>>   	while (!of_parse_phandle_with_args(dev->of_node, "iommus",
>>>   					   "#iommu-cells",
>>>   					   idx, &iommu_spec)) {
>>
>>
>>
>> Thanks,
>> Mauro
> 
> 
> 
> Thanks,
> Mauro
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
