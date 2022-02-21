Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id E48834BDB46
	for <lists.iommu@lfdr.de>; Mon, 21 Feb 2022 18:27:49 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 83A8E605C9;
	Mon, 21 Feb 2022 17:27:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wGvTJo8onykQ; Mon, 21 Feb 2022 17:27:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 9872760692;
	Mon, 21 Feb 2022 17:27:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 64793C0036;
	Mon, 21 Feb 2022 17:27:47 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4289BC0011
 for <iommu@lists.linux-foundation.org>; Mon, 21 Feb 2022 17:27:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2A166408AE
 for <iommu@lists.linux-foundation.org>; Mon, 21 Feb 2022 17:27:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZawJPPS9L2T8 for <iommu@lists.linux-foundation.org>;
 Mon, 21 Feb 2022 17:27:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp4.osuosl.org (Postfix) with ESMTP id 67743402D7
 for <iommu@lists.linux-foundation.org>; Mon, 21 Feb 2022 17:27:45 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8F5DB1063;
 Mon, 21 Feb 2022 09:27:44 -0800 (PST)
Received: from [10.57.40.147] (unknown [10.57.40.147])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8D1663F70D;
 Mon, 21 Feb 2022 09:27:42 -0800 (PST)
Message-ID: <71e94ac3-20fc-6f41-270f-fe246740e7e0@arm.com>
Date: Mon, 21 Feb 2022 17:27:30 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v3 8/9] drm/tegra: vic: Implement get_streamid_offset
Content-Language: en-GB
To: Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com,
 jonathanh@nvidia.com, joro@8bytes.org, will@kernel.org, robh+dt@kernel.org
References: <20220218113952.3077606-1-mperttunen@nvidia.com>
 <20220218113952.3077606-9-mperttunen@nvidia.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20220218113952.3077606-9-mperttunen@nvidia.com>
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
> Implement the get_streamid_offset required for supporting context
> isolation. Since old firmware cannot support context isolation
> without hacks that we don't want to implement, check the firmware
> binary to see if context isolation should be enabled.
> 
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>   drivers/gpu/drm/tegra/vic.c | 38 +++++++++++++++++++++++++++++++++++++
>   1 file changed, 38 insertions(+)
> 
> diff --git a/drivers/gpu/drm/tegra/vic.c b/drivers/gpu/drm/tegra/vic.c
> index 1e342fa3d27b..2863ee5e0e67 100644
> --- a/drivers/gpu/drm/tegra/vic.c
> +++ b/drivers/gpu/drm/tegra/vic.c
> @@ -38,6 +38,8 @@ struct vic {
>   	struct clk *clk;
>   	struct reset_control *rst;
>   
> +	bool can_use_context;
> +
>   	/* Platform configuration */
>   	const struct vic_config *config;
>   };
> @@ -229,6 +231,7 @@ static int vic_load_firmware(struct vic *vic)
>   {
>   	struct host1x_client *client = &vic->client.base;
>   	struct tegra_drm *tegra = vic->client.drm;
> +	u32 fce_bin_data_offset;
>   	dma_addr_t iova;
>   	size_t size;
>   	void *virt;
> @@ -277,6 +280,25 @@ static int vic_load_firmware(struct vic *vic)
>   		vic->falcon.firmware.phys = phys;
>   	}
>   
> +	/*
> +	 * Check if firmware is new enough to not require mapping firmware
> +	 * to data buffer domains.
> +	 */
> +	fce_bin_data_offset = *(u32 *)(virt + VIC_UCODE_FCE_DATA_OFFSET);
> +
> +	if (!vic->config->supports_sid) {
> +		vic->can_use_context = false;
> +	} else if (fce_bin_data_offset != 0x0 && fce_bin_data_offset != 0xa5a5a5a5) {
> +		/*
> +		 * Firmware will access FCE through STREAMID0, so context
> +		 * isolation cannot be used.
> +		 */
> +		vic->can_use_context = false;
> +		dev_warn_once(vic->dev, "context isolation disabled due to old firmware\n");
> +	} else {
> +		vic->can_use_context = true;
> +	}
> +
>   	return 0;
>   
>   cleanup:
> @@ -358,10 +380,26 @@ static void vic_close_channel(struct tegra_drm_context *context)
>   	host1x_channel_put(context->channel);
>   }
>   
> +static int vic_get_streamid_offset(struct tegra_drm_client *client)
> +{
> +	struct vic *vic = to_vic(client);
> +	int err;
> +
> +	err = vic_load_firmware(vic);
> +	if (err < 0)
> +		return err;
> +
> +	if (vic->can_use_context)
> +		return 0x30;
> +	else
> +		return -ENOTSUPP;
> +}
> +
>   static const struct tegra_drm_client_ops vic_ops = {
>   	.open_channel = vic_open_channel,
>   	.close_channel = vic_close_channel,
>   	.submit = tegra_drm_submit,
> +	.get_streamid_offset = vic_get_streamid_offset,

The patch order seems off here, since the .get_streamid_offset member 
isn't defined yet.

Robin.

>   };
>   
>   #define NVIDIA_TEGRA_124_VIC_FIRMWARE "nvidia/tegra124/vic03_ucode.bin"
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
