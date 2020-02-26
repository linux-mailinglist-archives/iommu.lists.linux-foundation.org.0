Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 93666170085
	for <lists.iommu@lfdr.de>; Wed, 26 Feb 2020 14:55:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 42CBE86E89;
	Wed, 26 Feb 2020 13:55:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HcKdJjIRaswX; Wed, 26 Feb 2020 13:55:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id B2E488558D;
	Wed, 26 Feb 2020 13:55:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A5A28C0177;
	Wed, 26 Feb 2020 13:55:25 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0704FC0177
 for <iommu@lists.linux-foundation.org>; Wed, 26 Feb 2020 13:55:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id E968F20130
 for <iommu@lists.linux-foundation.org>; Wed, 26 Feb 2020 13:55:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3iYDvEjxvVpE for <iommu@lists.linux-foundation.org>;
 Wed, 26 Feb 2020 13:55:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by silver.osuosl.org (Postfix) with ESMTP id A70262011A
 for <iommu@lists.linux-foundation.org>; Wed, 26 Feb 2020 13:55:19 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1A59B30E;
 Wed, 26 Feb 2020 05:55:19 -0800 (PST)
Received: from [10.1.196.37] (e121345-lin.cambridge.arm.com [10.1.196.37])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 969CC3F9E6;
 Wed, 26 Feb 2020 05:55:17 -0800 (PST)
Subject: Re: [PATCH] dt-bindings: arm-smmu: update the list of clocks
To: Matthias Kaehlcke <mka@chromium.org>,
 Sharat Masetty <smasetty@codeaurora.org>
References: <1582186342-3484-1-git-send-email-smasetty@codeaurora.org>
 <1582186342-3484-2-git-send-email-smasetty@codeaurora.org>
 <20200220210242.GC24720@google.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <9cb8551f-becd-d84e-e0ce-43f13b84ad89@arm.com>
Date: Wed, 26 Feb 2020 13:55:14 +0000
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200220210242.GC24720@google.com>
Content-Language: en-GB
Cc: devicetree@vger.kernel.org, will@kernel.org, linux-kernel@vger.kernel.org,
 dianders@chromium.org, bjorn.andersson@linaro.org,
 iommu@lists.linux-foundation.org, dri-devel@freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
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

[ /me fires off MAINTAINERS patch... ]

On 20/02/2020 9:02 pm, Matthias Kaehlcke wrote:
> On Thu, Feb 20, 2020 at 01:42:22PM +0530, Sharat Masetty wrote:
>> This patch adds a clock definition needed for powering on the GPU TBUs
>> and the GPU TCU.
>>
>> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
>> ---
>>   Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>> index 6515dbe..235c0df 100644
>> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>> @@ -28,6 +28,7 @@ properties:
>>             - enum:
>>                 - qcom,msm8996-smmu-v2
>>                 - qcom,msm8998-smmu-v2
>> +              - qcom,sc7180-smmu-v2
> 
> The addition of the compatible string isn't (directly) related with $subject,
> this should be done in a separate patch.

...or the patch should just be accurately described as "add support for 
new variant X, which requires an additional clock Y".

And speaking of which, can anyone clarify how "TCU and TBU core clock" 
manages to abbreviate to "mem_iface_clk"? I would have naively assumed 
something like "core" would be most logical.

Robin.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
