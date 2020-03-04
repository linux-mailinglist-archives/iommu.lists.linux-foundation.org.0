Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B64F1791FA
	for <lists.iommu@lfdr.de>; Wed,  4 Mar 2020 15:09:54 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 291A985C20;
	Wed,  4 Mar 2020 14:09:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JT3yK3h7zqou; Wed,  4 Mar 2020 14:09:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id DD2F1854C0;
	Wed,  4 Mar 2020 14:09:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B8E34C1D8E;
	Wed,  4 Mar 2020 14:09:51 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9429DC013E
 for <iommu@lists.linux-foundation.org>; Wed,  4 Mar 2020 14:09:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 8123087A2F
 for <iommu@lists.linux-foundation.org>; Wed,  4 Mar 2020 14:09:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yut7f75a99XB for <iommu@lists.linux-foundation.org>;
 Wed,  4 Mar 2020 14:09:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 9582787A12
 for <iommu@lists.linux-foundation.org>; Wed,  4 Mar 2020 14:09:49 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id y17so2566233wrn.6
 for <iommu@lists.linux-foundation.org>; Wed, 04 Mar 2020 06:09:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=EpXtvX1PfW3FZz13OtRHOjQvZ2fsaz2TnoP+n0E2ZUg=;
 b=g8SWXvPTyPZzLcsUAC4+i3gEYS7VjOjujoBVioj8kKYK73oXfKh+MAvo8mRWnu071C
 gxiMmhvSdwjKzrw34AWvhgikZX0Hrhz4jre0uVLyzI7CZYL/VDsf5gHJObclPdLagxZi
 s+6qEVWA3DXyXew+YkVb+rgAVC49YN8D3mPAbPfbz2b2vq1fO6ty0UB+H65pdv6FjJ6Y
 v3/70bPC/jxD75YgWO2V9B7pyWv0bv8SImmbScC8XftPtCDEBeJXHlj8SYkcVTIy6y7V
 32lZyBoyNgNFy1f0QHfB5NbM0+cCHEojMhPDvMZmAXMM6fqrb+f7yzzdQe1b3vIru/ak
 r5Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=EpXtvX1PfW3FZz13OtRHOjQvZ2fsaz2TnoP+n0E2ZUg=;
 b=h/xYmBtPDHAEPZPlnGaoCblClIa+yHFxFXuaJHzK/ZQyb1g0fpwUi/5CUR/iJEEgCy
 Vm5NHtNtxSdU1VpQ/WO5GkR8mQZVTz2pdn1w68bwDzeFACFh/DwUS3MUXAutLhiU7NXZ
 TJbw9gSg+yqHhT2EVP3oErc/F7eeEXm90hufcZHHNjJRJIMQjoKodCvGLU3iHhODvtLU
 QEMMmMaO2wZ6SB/YkoU0hg1wnKUCU85exFu1eqHJaE1qcnbR+Dnoo47elBngx3PESPFF
 9qHdmyyqY0lIM9avo00cnWcE0p5whpj0+AEmaVKR0FT1uOLJne81WEyWKn3Axq9/WVAe
 tfAw==
X-Gm-Message-State: ANhLgQ1y6xmmLvkrfW04GCm6z15PtvwSC2nhggEwOkH2INktyZLTbYb0
 UGVr4lbq5UGhNp9zZ0dLsGlCcA==
X-Google-Smtp-Source: ADFU+vtZMIq6Jg8tdrdLMObmNELyKi8gzYZ2wKQ8Qt7PTkGgWzXVAaeuMwK7RkrXzELghSD1BcL3DQ==
X-Received: by 2002:adf:e542:: with SMTP id z2mr4532686wrm.150.1583330987727; 
 Wed, 04 Mar 2020 06:09:47 -0800 (PST)
Received: from myrica ([2001:171b:c9a8:fbc0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id q12sm41792293wrg.71.2020.03.04.06.09.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2020 06:09:46 -0800 (PST)
Date: Wed, 4 Mar 2020 15:09:40 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Xu Zaibo <xuzaibo@huawei.com>
Subject: Re: [PATCH v4 23/26] iommu/arm-smmu-v3: Add stall support for
 platform devices
Message-ID: <20200304140940.GC646000@myrica>
References: <20200224182401.353359-1-jean-philippe@linaro.org>
 <20200224182401.353359-24-jean-philippe@linaro.org>
 <db6fc8c2-2ff3-631f-2294-c1b49acd27aa@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <db6fc8c2-2ff3-631f-2294-c1b49acd27aa@huawei.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, kevin.tian@intel.com,
 will@kernel.org, Jean-Philippe Brucker <jean-philippe.brucker@arm.com>,
 linux-pci@vger.kernel.org, linux-mm@kvack.org,
 iommu@lists.linux-foundation.org, robh+dt@kernel.org, catalin.marinas@arm.com,
 zhangfei.gao@linaro.org, robin.murphy@arm.com, christian.koenig@amd.com,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On Wed, Feb 26, 2020 at 04:44:53PM +0800, Xu Zaibo wrote:
> Hi,
> 
> 
> On 2020/2/25 2:23, Jean-Philippe Brucker wrote:
> > From: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
> > 
> > The SMMU provides a Stall model for handling page faults in platform
> > devices. It is similar to PCI PRI, but doesn't require devices to have
> > their own translation cache. Instead, faulting transactions are parked and
> > the OS is given a chance to fix the page tables and retry the transaction.
> > 
> > Enable stall for devices that support it (opt-in by firmware). When an
> > event corresponds to a translation error, call the IOMMU fault handler. If
> > the fault is recoverable, it will call us back to terminate or continue
> > the stall.
> > 
> > Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > ---
> >   drivers/iommu/arm-smmu-v3.c | 271 ++++++++++++++++++++++++++++++++++--
> >   drivers/iommu/of_iommu.c    |   5 +-
> >   include/linux/iommu.h       |   2 +
> >   3 files changed, 269 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/iommu/arm-smmu-v3.c b/drivers/iommu/arm-smmu-v3.c
> > index 6a5987cce03f..da5dda5ba26a 100644
> > --- a/drivers/iommu/arm-smmu-v3.c
> > +++ b/drivers/iommu/arm-smmu-v3.c
> > @@ -374,6 +374,13 @@
> >   #define CMDQ_PRI_1_GRPID		GENMASK_ULL(8, 0)
> >   #define CMDQ_PRI_1_RESP			GENMASK_ULL(13, 12)
> [...]
> > +static int arm_smmu_page_response(struct device *dev,
> > +				  struct iommu_fault_event *unused,
> > +				  struct iommu_page_response *resp)
> > +{
> > +	struct arm_smmu_cmdq_ent cmd = {0};
> > +	struct arm_smmu_master *master = dev_iommu_fwspec_get(dev)->iommu_priv;
> Here can use 'dev_to_master' ?

Certainly, good catch

Thanks,
Jean
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
