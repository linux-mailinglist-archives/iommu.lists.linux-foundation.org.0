Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA17190A39
	for <lists.iommu@lfdr.de>; Tue, 24 Mar 2020 11:08:29 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5BFB586E59;
	Tue, 24 Mar 2020 10:08:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LmJ88JEjdgLc; Tue, 24 Mar 2020 10:08:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 60F3686E88;
	Tue, 24 Mar 2020 10:08:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4C5EFC0177;
	Tue, 24 Mar 2020 10:08:27 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 07644C0177
 for <iommu@lists.linux-foundation.org>; Tue, 24 Mar 2020 10:08:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id D8965204B6
 for <iommu@lists.linux-foundation.org>; Tue, 24 Mar 2020 10:08:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6Ln76OwXSLTc for <iommu@lists.linux-foundation.org>;
 Tue, 24 Mar 2020 10:08:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by silver.osuosl.org (Postfix) with ESMTPS id 2F34C203DB
 for <iommu@lists.linux-foundation.org>; Tue, 24 Mar 2020 10:08:24 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 998162E2; Tue, 24 Mar 2020 11:08:20 +0100 (CET)
Date: Tue, 24 Mar 2020 11:08:19 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v3 10/15] iommu/arm-smmu: Use accessor functions for
 iommu private data
Message-ID: <20200324100819.GA4038@8bytes.org>
References: <20200320091414.3941-1-joro@8bytes.org>
 <20200320091414.3941-11-joro@8bytes.org>
 <09ed4676-449e-c6eb-8c51-c15b326c206c@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <09ed4676-449e-c6eb-8c51-c15b326c206c@arm.com>
Cc: Joerg Roedel <jroedel@suse.de>, Will Deacon <will@kernel.org>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "guohanjun@huawei.com" <guohanjun@huawei.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Andy Gross <agross@kernel.org>, Sudeep Holla <Sudeep.Holla@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Paul <sean@poorly.run>
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

Hey Robin,

On Mon, Mar 23, 2020 at 04:02:33PM +0000, Robin Murphy wrote:
> Yikes, this ends up pretty ugly, and I'd prefer not have this much
> complexity hidden in macros that were intended just to be convenient
> shorthand. Would you mind pulling in the patch below as a precursor?

Sure thing, but your mail-client seemed to have fiddled with the patch
so that is is unusable to me. I tried to fix it up, but it still doesn't
apply. Can you please re-send it to me either via git-send-email or just
as a mime-attachement?

> Other than that, the rest of the series looks OK at a glance. We should also
> move fwspec->ops to dev_iommu, as those are "IOMMU API" data rather than
> "firmware" data, but let's consider that separately as this series is
> already long enough.

Yes, moving ops out of fwspec is next on the list, and moving the
iommu_group pointer into dev_iommu.

Regards,

	Joerg

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
