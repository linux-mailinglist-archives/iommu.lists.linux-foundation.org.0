Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E32D56A312
	for <lists.iommu@lfdr.de>; Thu,  7 Jul 2022 15:02:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BEF3061041;
	Thu,  7 Jul 2022 13:02:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BEF3061041
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=CAA7zEGg
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CyyesaHiaHxz; Thu,  7 Jul 2022 13:02:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 345DA611F8;
	Thu,  7 Jul 2022 13:02:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 345DA611F8
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DC303C007D;
	Thu,  7 Jul 2022 13:02:17 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 74437C002D
 for <iommu@lists.linux-foundation.org>; Thu,  7 Jul 2022 13:02:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 480344189E
 for <iommu@lists.linux-foundation.org>; Thu,  7 Jul 2022 13:02:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 480344189E
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=CAA7zEGg
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BwPiAQW7YlZl for <iommu@lists.linux-foundation.org>;
 Thu,  7 Jul 2022 13:02:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E62041A0E
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0E62041A0E
 for <iommu@lists.linux-foundation.org>; Thu,  7 Jul 2022 13:02:14 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id b26so26248804wrc.2
 for <iommu@lists.linux-foundation.org>; Thu, 07 Jul 2022 06:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:content-language:to:cc
 :references:from:subject:in-reply-to:content-transfer-encoding;
 bh=XaV30yfY2MX777NwLyZ9LT1ytNc0L79CG7OYsrOikpE=;
 b=CAA7zEGg/B8eWgsrOCy2qd+dv2w6BaWSmNa5cx1jNFhJrobaQdqWq0dwV76x3Hssff
 cNkX4kAbUQX4h1kveFK0AwfDfYH/ytAFuDaQEPJFkQh4X1Gca85pXeWOOCrxuokwAqja
 Z28wQOsjQHkOYdfe7M4djt7qrt0wBTNSIHruMQHjpCX8eXAz3VTYyMl5SLU/fw3jzmLO
 onu3c3TzgiCsa5VY9Me4in1ZmpTmk+fmv8SOAcy/mWrU5dhnXs7Of7UYm84A1DL0IKne
 cg6tlOJ6dk72QX5KVtJL5aPeANgdEX8oty+NeSZ2j8DnbWv7eUOv0m4Kpen/1n74Okhg
 GowA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=XaV30yfY2MX777NwLyZ9LT1ytNc0L79CG7OYsrOikpE=;
 b=5p4y301V/B9pTtWvuCHqQn2d7T42jZMn2saobzRBuxBf2894vO76AAeepVXJcIAaHz
 uuVbwyItcHtBKVcNpz0MR+u9g/P4KJ5iKZXL1g0ZHpc323FHicM2yBeK8Rqrv/uh8Yqe
 cJvFuP4e/8ygD9shjxzTyPAw0TnUL/LJAykeKQUtgjqIqVxgdPx7Pn4uBxG8QaM46sq3
 zCxdoGO1PApSf0ELiZDhu5wKl04UogoRkvJih8GsR6bIC2HZ8Sw6PesJDlsy3ylNmLYG
 /mX/86J3DbcGSmogb4Tcq/I2q2XRm8p/P/Ua/HI2DlmJn4y0s3YMn4D/wqiZMdSa2Vqo
 OjAQ==
X-Gm-Message-State: AJIora8emq3J/L1Ab/QJXdKq935/4bs5+ytMSIxxMcVc+LgDNebtZd4s
 6O+plgjb3RcL7Vrq//lQ/TE=
X-Google-Smtp-Source: AGRyM1tD7/UCBhqliXFJCFgwWHWFzMcyZ0xmXaYmCAAG5xFaBJzHgi1bGNvjXkiKigl0APxRcvEW9A==
X-Received: by 2002:a05:6000:68e:b0:21d:76e3:cc80 with SMTP id
 bo14-20020a056000068e00b0021d76e3cc80mr12082902wrb.327.1657198933038; 
 Thu, 07 Jul 2022 06:02:13 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 e10-20020a05600c4e4a00b00397402ae674sm20518878wmq.11.2022.07.07.06.02.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Jul 2022 06:02:12 -0700 (PDT)
Message-ID: <665651cb-a070-4d48-9d36-92bab1814267@gmail.com>
Date: Thu, 7 Jul 2022 15:02:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Tinghan Shen <tinghan.shen@mediatek.com>, Yong Wu <yong.wu@mediatek.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Weiyi Lu <weiyi.lu@mediatek.com>
References: <20220704100028.19932-1-tinghan.shen@mediatek.com>
 <20220704100028.19932-3-tinghan.shen@mediatek.com>
 <119f2a98-ef56-7b99-631f-221b737939ae@linaro.org>
 <9757b32c-c196-f7e0-3c61-1d4edae854dc@gmail.com>
 <4c3443f4-a65d-331b-851a-01f5275bbf4b@linaro.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v1 02/16] dt-bindings: memory: mediatek: Update condition
 for mt8195 smi node
In-Reply-To: <4c3443f4-a65d-331b-851a-01f5275bbf4b@linaro.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
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



On 06/07/2022 16:38, Krzysztof Kozlowski wrote:
> On 06/07/2022 15:48, Matthias Brugger wrote:
>>
>>
>> On 04/07/2022 14:36, Krzysztof Kozlowski wrote:
>>> On 04/07/2022 12:00, Tinghan Shen wrote:
>>>> The max clock items for the dts node with compatible
>>>> 'mediatek,mt8195-smi-sub-common' should be 3.
>>>>
>>>> However, the dtbs_check of such node will get following message,
>>>> arch/arm64/boot/dts/mediatek/mt8195-evb.dtb: smi@14010000: clock-names: ['apb', 'smi', 'gals0'] is too long
>>>>            From schema: Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
>>>>
>>>> Remove the last 'else' checking to fix this error.
>>>
>>> Missing fixes tag.
>>>
>>
>>   From my understanding, fixes tags are for patches that fix bugs (hw is not
>> working etc) and not a warning message from dtbs_check. So my point of view
>> would be to not add a fixes tag here.
> 
> Not conforming to bindings is also a bug. Missing properties or wrong
> properties, even if hardware is working, is still a bug. If such bug is
> not visible now in Linux, might be visible later in the future or
> visible in different OS (DTS are used by other systems and pieces of
> software like bootloaders). Limiting this only to Linux and to current
> version (hardware still works) is OK for Linux drivers, but not for DTS.
> 

If a wrong DTS breaks software, then it's worth a fixes tag, especially for the 
DTS part, we could argue about the bindings part, but in that case it would be 
probably OK.

> Therefore Fixes tag in general is applicable. Of course maybe to this
> one not really, maybe this is too trivial, or whatever, so I do not
> insist. But I insist on the principle - reasonable dtbs_check warnings
> are like compiler warnings - bugs which have to be fixed.
> 

I'm not arguing that these things shouldn't be fixed, but that they are worth 
being back-ported to the stable branches.

Regards,
Matthias
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
