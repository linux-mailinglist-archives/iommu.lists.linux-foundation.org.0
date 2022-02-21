Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A424BDA86
	for <lists.iommu@lfdr.de>; Mon, 21 Feb 2022 16:23:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ADD07404D8;
	Mon, 21 Feb 2022 15:23:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LLq9E8-BOifw; Mon, 21 Feb 2022 15:23:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 333F04036A;
	Mon, 21 Feb 2022 15:23:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0C209C0011;
	Mon, 21 Feb 2022 15:23:39 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 38FFAC0011
 for <iommu@lists.linux-foundation.org>; Mon, 21 Feb 2022 15:23:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2734D40184
 for <iommu@lists.linux-foundation.org>; Mon, 21 Feb 2022 15:23:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k6yW92lSXiAK for <iommu@lists.linux-foundation.org>;
 Mon, 21 Feb 2022 15:23:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp4.osuosl.org (Postfix) with ESMTP id 706A840179
 for <iommu@lists.linux-foundation.org>; Mon, 21 Feb 2022 15:23:37 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 841F11042;
 Mon, 21 Feb 2022 07:23:36 -0800 (PST)
Received: from [10.57.40.147] (unknown [10.57.40.147])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B26153F70D;
 Mon, 21 Feb 2022 07:23:34 -0800 (PST)
Message-ID: <48ac567b-37e8-1fa2-c389-536e276fdd2c@arm.com>
Date: Mon, 21 Feb 2022 15:23:29 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v3 1/9] dt-bindings: host1x: Add memory-contexts property
Content-Language: en-GB
To: Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com,
 jonathanh@nvidia.com, joro@8bytes.org, will@kernel.org, robh+dt@kernel.org
References: <20220218113952.3077606-1-mperttunen@nvidia.com>
 <20220218113952.3077606-2-mperttunen@nvidia.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20220218113952.3077606-2-mperttunen@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

On 2022-02-18 11:39, Mikko Perttunen via iommu wrote:
> Add schema information for the memory-contexts property used to
> specify context stream IDs. This uses the standard iommu-map property
> inside a child node.

Couldn't you simply make "iommu-map" an allowed property on the host1x 
node itself? From a DT perspective I'm not sure the intermediate node 
really fits meaningfully, and I can't see that it serves much purpose in 
practice either, other than perhaps defeating fw_devlink.

Robin.

> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
> v3:
> * New patch
> ---
>   .../bindings/display/tegra/nvidia,tegra20-host1x.yaml  | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml
> index 4fd513efb0f7..3ac0fde54a16 100644
> --- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml
> +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml
> @@ -144,6 +144,16 @@ allOf:
>           reset-names:
>             maxItems: 1
>   
> +        memory-contexts:
> +          type: object
> +          properties:
> +            iommu-map:
> +              description: Specification of stream IDs available for memory context device
> +                use. Should be a mapping of IDs 0..n to IOMMU entries corresponding to
> +                usable stream IDs.
> +          required:
> +            - iommu-map
> +
>         required:
>           - reg-names
>   
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
