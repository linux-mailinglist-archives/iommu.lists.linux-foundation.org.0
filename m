Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id A685E332A2
	for <lists.iommu@lfdr.de>; Mon,  3 Jun 2019 16:48:59 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id A9545DE0;
	Mon,  3 Jun 2019 14:48:57 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 40F79AAE
	for <iommu@lists.linux-foundation.org>;
	Mon,  3 Jun 2019 14:48:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id E4E72876
	for <iommu@lists.linux-foundation.org>;
	Mon,  3 Jun 2019 14:48:55 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id A2FA360FEB; Mon,  3 Jun 2019 14:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1559573335;
	bh=wmoyPPaA8jIHMpOlZBcNsMxuLi2MxGFaoo8cyvL/4vc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q6D29WeeBtajNgR3/diaSCi5G1OQpJ1ET9nzjd9biggspT1oqLnYYXtxlc+1w1dN4
	E6RCMkzMF7PJsGZYaKgx2m3XTXUH0KFRN7NBaH5D/cJZkqSjrKYGYNe0fK3ZRu+wS1
	HkbS56XHSHp43YaHJTqLnEkFUgrg9NsaxAT0RVX0=
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
	[199.106.103.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: jcrouse@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 0C98C6074F;
	Mon,  3 Jun 2019 14:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1559573334;
	bh=wmoyPPaA8jIHMpOlZBcNsMxuLi2MxGFaoo8cyvL/4vc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YYG9f7cy6p6luyC1AgZvLfOFGLyxCO29eirTTmZjQY4Nx4kCr3Ure3l14036D3gg7
	JIphsgGXr/l6WnM/RsZEXmr93gIzSj0IA1H4IejYQYEryr3N5T4uD3PFPav4fFRAAV
	g8lrWkVOl5dtfEIbXdC8hf95q1ikEIc9qAZuDbO4=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0C98C6074F
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date: Mon, 3 Jun 2019 08:48:51 -0600
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] of/device: add blacklist for iommu dma_ops
Message-ID: <20190603144851.GD23227@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Thierry Reding <thierry.reding@gmail.com>,
	Rob Clark <robdclark@gmail.com>, devicetree@vger.kernel.org,
	David Airlie <airlied@linux.ie>,
	Frank Rowand <frowand.list@gmail.com>,
	Will Deacon <will.deacon@arm.com>,
	Doug Anderson <dianders@chromium.org>,
	dri-devel <dri-devel@lists.freedesktop.org>,
	Linux IOMMU <iommu@lists.linux-foundation.org>,
	Rob Herring <robh+dt@kernel.org>, Sean Paul <seanpaul@chromium.org>,
	linux-arm-msm <linux-arm-msm@vger.kernel.org>,
	freedreno <freedreno@lists.freedesktop.org>,
	Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <CAL_JsqJmPqis46Un91QyhXgdrVtfATMP_hTp6wSeSAfc8MLFfw@mail.gmail.com>
	<CAF6AEGs9Nsft8ofZkGz_yWBPBC+prh8dBSkJ4PJr8yk2c5FMdQ@mail.gmail.com>
	<CAF6AEGt-dhbQS5zZCNVTLT57OiUwO0RiP5bawTSu2RKZ-7W-aw@mail.gmail.com>
	<CAAFQd5BdrJFL5LKK8O5NPDKWfFgkTX_JU-jU3giEz33tj-jwCA@mail.gmail.com>
	<CAF6AEGtj+kyXqKeJK2-0e1jw_A4wz-yBEyv5zhf5Vfoi2_p2CA@mail.gmail.com>
	<401f9948-14bd-27a2-34c1-fb429cae966d@arm.com>
	<CAF6AEGuGGAThqs9ztTNyGnMyhFc9wbtn=N8A4qqQxcN_PAxsEw@mail.gmail.com>
	<20190603135408.GE30132@ulmo>
	<CAF6AEGtrfqYBNyjpHsUy1Tj-FJZ0MybvAJdHQsqb5kqih2BY3A@mail.gmail.com>
	<20190603144016.GG30132@ulmo>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190603144016.GG30132@ulmo>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
	linux-arm-msm <linux-arm-msm@vger.kernel.org>,
	Will Deacon <will.deacon@arm.com>, Doug Anderson <dianders@chromium.org>,
	dri-devel <dri-devel@lists.freedesktop.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Linux IOMMU <iommu@lists.linux-foundation.org>,
	Sean Paul <seanpaul@chromium.org>,
	freedreno <freedreno@lists.freedesktop.org>,
	Frank Rowand <frowand.list@gmail.com>, Christoph Hellwig <hch@lst.de>,
	Robin Murphy <robin.murphy@arm.com>
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

> It shouldn't be a problem to hook something else up to the IOMMU
> subsystem. Hopefully it's something that people are going to standardize
> on.
> 
> > 3) The automatic attach of DMA domain is also causing a different
> >    problem for us on the GPU side, preventing us from supporting per-
> >    context pagetables (since we end up with a disagreement about
> >    which context bank is used between arm-smmu and the firmware).
> 
> I'm not sure I understand this issue. Is the context bank hard-coded in
> the firmware somehow? Or is it possible to rewrite which one is going to
> be used at runtime? Do you switch out the actual page tables rather than
> the IOMMU domains for context switching?
 
We have a rather long history on this but the tl;dr is that the GPU microcode
switches the pagetables by rewriting TTBR0 on the fly (since this is
arm-smmu-v2 we have no better option) and yes, unfortunately it is hard coded
to use context bank 0. [1] is the current patchset to support all this,
including my own take on avoiding the dma-domain (all the cool kids have one).

Jordan

[1] https://patchwork.freedesktop.org/series/57441/

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
