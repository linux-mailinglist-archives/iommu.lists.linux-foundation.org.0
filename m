Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E231493D41
	for <lists.iommu@lfdr.de>; Wed, 19 Jan 2022 16:34:34 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 894ED402A8;
	Wed, 19 Jan 2022 15:34:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AbiPknL7H8jK; Wed, 19 Jan 2022 15:34:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id E909940210;
	Wed, 19 Jan 2022 15:34:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AFF15C0077;
	Wed, 19 Jan 2022 15:34:30 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A4ECDC002F
 for <iommu@lists.linux-foundation.org>; Wed, 19 Jan 2022 15:34:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8BE6360782
 for <iommu@lists.linux-foundation.org>; Wed, 19 Jan 2022 15:34:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=foss.st.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i3Y5FbRQI0Yo for <iommu@lists.linux-foundation.org>;
 Wed, 19 Jan 2022 15:34:28 +0000 (UTC)
X-Greylist: delayed 00:11:12 by SQLgrey-1.8.0
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D506E60769
 for <iommu@lists.linux-foundation.org>; Wed, 19 Jan 2022 15:34:27 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20JF9iDc008291;
 Wed, 19 Jan 2022 16:21:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=m/aWoxbwO4ww33sxaSzrOIlxUKriBNkq4+frD3/0F5Y=;
 b=aUlpneYD1/Myb/Bi5Sf2uaY7bPgcTvI5O4fx5VCC7EhIC+iSqb+ce3LtpyCtgSKUgiUB
 C8VdKQEXzQvGAZERCdTDVWKDG0MKpTeORJEbfNMS3LP95/TB3jU9UhuP+QV46DGbbsqR
 E45Je0X5Rd5P67ppfhNt7Wog1Rv2AWHpyFGYl9gTGYnidnBMb/yLh83KZdRZvpafudXh
 254ZekIe3dgdgmu1NnXE0VkJAEJZa4JZZv4/Q3zXj0oyTQlpivYViygkK1/C52A91o8X
 vW/VbK+o6cKSp09BWrKsVnnWEZPGfR+jufJ6BVL41J2lp5FAYTM1kgfRFg5rWI8vM4Qm 0w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3dnsd0g3dn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Jan 2022 16:21:44 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8A5C5100038;
 Wed, 19 Jan 2022 16:21:35 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node1.st.com [10.75.127.4])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E3E5921BF59;
 Wed, 19 Jan 2022 16:21:34 +0100 (CET)
Received: from lmecxl0889.lme.st.com (10.75.127.44) by SFHDAG2NODE1.st.com
 (10.75.127.4) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Wed, 19 Jan
 2022 16:21:32 +0100
Subject: Re: [PATCH] dt-bindings: Improve phandle-array schemas
To: Rob Herring <robh@kernel.org>, <devicetree@vger.kernel.org>
References: <20220119015038.2433585-1-robh@kernel.org>
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <de35edd9-b85d-0ed7-98b6-7a41134c3ece@foss.st.com>
Date: Wed, 19 Jan 2022 16:21:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220119015038.2433585-1-robh@kernel.org>
Content-Language: en-US
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE1.st.com
 (10.75.127.4)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-19_08,2022-01-19_01,2021-12-02_01
Cc: Andrew Lunn <andrew@lunn.ch>, Ulf Hansson <ulf.hansson@linaro.org>,
 linux-usb@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 "Rafael J.
 Wysocki" <rafael@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 linux-remoteproc@vger.kernel.org, alsa-devel@alsa-project.org,
 dri-devel@lists.freedesktop.org, Sebastian Reichel <sre@kernel.org>,
 linux-ide@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Pavel Machek <pavel@ucw.cz>, linux-phy@lists.infradead.org,
 netdev@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>,
 Lee Jones <lee.jones@linaro.org>, linux-riscv@lists.infradead.org,
 linux-leds@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Marc Zyngier <maz@kernel.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, iommu@lists.linux-foundation.org,
 Kishon Vijay Abraham I <kishon@ti.com>, Jakub Kicinski <kuba@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, Vivien Didelot <vivien.didelot@gmail.com>,
 Wolfgang Grandegger <wg@grandegger.com>, linux-media@vger.kernel.org,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, linux-pm@vger.kernel.org,
 Kalle Valo <kvalo@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
 linux-can@vger.kernel.org, linux-gpio@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mark Brown <broonie@kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Kevin Hilman <khilman@kernel.org>,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 linux-crypto@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Viresh Kumar <vireshk@kernel.org>, dmaengine@vger.kernel.org,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>
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

Hello Rob,

On 1/19/22 2:50 AM, Rob Herring wrote:
> The 'phandle-array' type is a bit ambiguous. It can be either just an
> array of phandles or an array of phandles plus args. Many schemas for
> phandle-array properties aren't clear in the schema which case applies
> though the description usually describes it.
> 
> The array of phandles case boils down to needing:
> 
> items:
>   maxItems: 1
> 
> The phandle plus args cases should typically take this form:
> 
> items:
>   - items:
>       - description: A phandle
>       - description: 1st arg cell
>       - description: 2nd arg cell
> 
> With this change, some examples need updating so that the bracketing of
> property values matches the schema.
> 
> Cc: Damien Le Moal <damien.lemoal@opensource.wdc.com>
> Cc: Herbert Xu <herbert@gondor.apana.org.au>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: Georgi Djakov <djakov@kernel.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Joerg Roedel <joro@8bytes.org>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Jingoo Han <jingoohan1@gmail.com>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Cc: Jakub Kicinski <kuba@kernel.org>
> Cc: Wolfgang Grandegger <wg@grandegger.com>
> Cc: Marc Kleine-Budde <mkl@pengutronix.de>
> Cc: Andrew Lunn <andrew@lunn.ch>
> Cc: Vivien Didelot <vivien.didelot@gmail.com>
> Cc: Florian Fainelli <f.fainelli@gmail.com>
> Cc: Vladimir Oltean <olteanv@gmail.com>
> Cc: Kalle Valo <kvalo@kernel.org>
> Cc: Viresh Kumar <vireshk@kernel.org>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Kishon Vijay Abraham I <kishon@ti.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Kevin Hilman <khilman@kernel.org>
> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> Cc: Sebastian Reichel <sre@kernel.org>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> Cc: Zhang Rui <rui.zhang@intel.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Jonathan Hunter <jonathanh@nvidia.com>
> Cc: Sudeep Holla <sudeep.holla@arm.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: linux-ide@vger.kernel.org
> Cc: linux-crypto@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: dmaengine@vger.kernel.org
> Cc: linux-pm@vger.kernel.org
> Cc: iommu@lists.linux-foundation.org
> Cc: linux-leds@vger.kernel.org
> Cc: linux-media@vger.kernel.org
> Cc: netdev@vger.kernel.org
> Cc: linux-can@vger.kernel.org
> Cc: linux-wireless@vger.kernel.org
> Cc: linux-phy@lists.infradead.org
> Cc: linux-gpio@vger.kernel.org
> Cc: linux-riscv@lists.infradead.org
> Cc: linux-remoteproc@vger.kernel.org
> Cc: alsa-devel@alsa-project.org
> Cc: linux-usb@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---

[...]

>  .../bindings/remoteproc/st,stm32-rproc.yaml   | 33 ++++++--

[...]

> diff --git a/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
> index b587c97c282b..be3d9b0e876b 100644
> --- a/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
> @@ -29,17 +29,22 @@ properties:
>  
>    st,syscfg-holdboot:
>      description: remote processor reset hold boot
> -      - Phandle of syscon block.
> -      - The offset of the hold boot setting register.
> -      - The field mask of the hold boot.
>      $ref: "/schemas/types.yaml#/definitions/phandle-array"
> -    maxItems: 1
> +    items:
> +      - items:
> +          - description: Phandle of syscon block
> +          - description: The offset of the hold boot setting register
> +          - description: The field mask of the hold boot
>  
>    st,syscfg-tz:
>      description:
>        Reference to the system configuration which holds the RCC trust zone mode
>      $ref: "/schemas/types.yaml#/definitions/phandle-array"
> -    maxItems: 1
> +    items:
> +      - items:
> +          - description: Phandle of syscon block
> +          - description: FIXME
> +          - description: FIXME

         - description: The offset of the trust zone setting register
         - description: The field mask of the trust zone state

>  
>    interrupts:
>      description: Should contain the WWDG1 watchdog reset interrupt
> @@ -93,20 +98,32 @@ properties:
>      $ref: "/schemas/types.yaml#/definitions/phandle-array"
>      description: |
>        Reference to the system configuration which holds the remote
> -    maxItems: 1
> +    items:
> +      - items:
> +          - description: Phandle of syscon block
> +          - description: FIXME
> +          - description: FIXME

         - description: The offset of the power setting register
         - description: The field mask of the PDDS selection

>  
>    st,syscfg-m4-state:
>      $ref: "/schemas/types.yaml#/definitions/phandle-array"
>      description: |
>        Reference to the tamp register which exposes the Cortex-M4 state.
> -    maxItems: 1
> +    items:
> +      - items:
> +          - description: Phandle of syscon block with the tamp register
> +          - description: FIXME
> +          - description: FIXME

         - description: The offset of the tamp register
         - description: The field mask of the Cortex-M4 state

>  
>    st,syscfg-rsc-tbl:
>      $ref: "/schemas/types.yaml#/definitions/phandle-array"
>      description: |
>        Reference to the tamp register which references the Cortex-M4
>        resource table address.
> -    maxItems: 1
> +    items:
> +      - items:
> +          - description: Phandle of syscon block with the tamp register
> +          - description: FIXME
> +          - description: FIXME

         - description: The offset of the tamp register
         - description: The field mask of the Cortex-M4 resource table address

Please tell me if you prefer that I fix this in a dedicated patch.

Thanks,
Arnaud
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
