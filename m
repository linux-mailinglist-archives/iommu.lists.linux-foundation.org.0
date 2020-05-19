Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B101D9635
	for <lists.iommu@lfdr.de>; Tue, 19 May 2020 14:25:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 604538801A;
	Tue, 19 May 2020 12:25:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 99fyM4M4H1bU; Tue, 19 May 2020 12:25:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2758488023;
	Tue, 19 May 2020 12:25:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 02775C0890;
	Tue, 19 May 2020 12:25:07 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CA495C0176
 for <iommu@lists.linux-foundation.org>; Tue, 19 May 2020 12:25:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id B974A86599
 for <iommu@lists.linux-foundation.org>; Tue, 19 May 2020 12:25:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tN_HMKqZjHpT for <iommu@lists.linux-foundation.org>;
 Tue, 19 May 2020 12:25:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 98B1486444
 for <iommu@lists.linux-foundation.org>; Tue, 19 May 2020 12:25:01 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id B216B386; Tue, 19 May 2020 14:24:59 +0200 (CEST)
Date: Tue, 19 May 2020 14:24:58 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH v2] iommu/qcom: add optional 'tbu' clock for TLB invalidate
Message-ID: <20200519122458.GJ18353@8bytes.org>
References: <20200518141656.26284-1-shawn.guo@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200518141656.26284-1-shawn.guo@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-arm-msm@vger.kernel.org, Konrad Dybcio <konradybcio@gmail.com>,
 iommu@lists.linux-foundation.org,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>
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

On Mon, May 18, 2020 at 10:16:56PM +0800, Shawn Guo wrote:
> On some SoCs like MSM8939 with A405 adreno, there is a gfx_tbu clock
> needs to be on while doing TLB invalidate. Otherwise, TLBSYNC status
> will not be correctly reflected, causing the system to go into a bad
> state.  Add it as an optional clock, so that platforms that have this
> clock can pass it over DT.
> 
> While adding the third clock, let's switch to bulk clk API to simplify
> the enable/disable calls.  clk_bulk_get() cannot used because the
> existing two clocks are required while the new one is optional.
> 
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> ---
> Changes for v2:
>  - Use devm_clk_get_optional() to simplify code and improve readability.
>  - Rename the new clock from 'tlb' to 'tbu'.
>  - qcom_iommu: use bulk clk API to simplfy enable/disable.
> 
>  drivers/iommu/qcom_iommu.c | 62 ++++++++++++++++----------------------
>  1 file changed, 26 insertions(+), 36 deletions(-)

Applied, thanks.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
