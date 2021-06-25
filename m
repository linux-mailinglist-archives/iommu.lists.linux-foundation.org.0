Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC293B4447
	for <lists.iommu@lfdr.de>; Fri, 25 Jun 2021 15:19:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C37541604;
	Fri, 25 Jun 2021 13:19:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I0VbPYiasndI; Fri, 25 Jun 2021 13:19:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 75BA7415F0;
	Fri, 25 Jun 2021 13:19:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 39F40C0022;
	Fri, 25 Jun 2021 13:19:05 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0606BC000E
 for <iommu@lists.linux-foundation.org>; Fri, 25 Jun 2021 13:19:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DAA83607B2
 for <iommu@lists.linux-foundation.org>; Fri, 25 Jun 2021 13:19:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TK9h_J_lGAUl for <iommu@lists.linux-foundation.org>;
 Fri, 25 Jun 2021 13:19:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org
 [IPv6:2a01:238:4383:600:38bc:a715:4b6d:a889])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 46295605F0
 for <iommu@lists.linux-foundation.org>; Fri, 25 Jun 2021 13:19:03 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id A7AA23FC; Fri, 25 Jun 2021 15:18:59 +0200 (CEST)
Date: Fri, 25 Jun 2021 15:18:58 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2 0/3] iommu: Enable non-strict DMA on QCom SD/MMC
Message-ID: <YNXXwvuErVnlHt+s@8bytes.org>
References: <20210624171759.4125094-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210624171759.4125094-1-dianders@chromium.org>
Cc: ulf.hansson@linaro.org, linux-doc@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, linux-pci@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Thierry Reding <thierry.reding@gmail.com>, joel@joelfernandes.org,
 rajatja@google.com, will@kernel.org, robdclark@chromium.org,
 saravanak@google.com, Jonathan Corbet <corbet@lwn.net>,
 quic_c_gdjako@quicinc.com, linux-arm-kernel@lists.infradead.org,
 Viresh Kumar <viresh.kumar@linaro.org>, vbadigan@codeaurora.org,
 "Paul E. McKenney" <paulmck@kernel.org>, linux-arm-msm@vger.kernel.org,
 bhelgaas@google.com, sonnyrao@chromium.org, Vlastimil Babka <vbabka@suse.cz>,
 Randy Dunlap <rdunlap@infradead.org>, linux-mmc@vger.kernel.org,
 adrian.hunter@intel.com, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Andrew Morton <akpm@linux-foundation.org>,
 robin.murphy@arm.com, "Maciej W. Rozycki" <macro@orcam.me.uk>
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

Hi Douglas,

On Thu, Jun 24, 2021 at 10:17:56AM -0700, Douglas Anderson wrote:
> The goal of this patch series is to get better SD/MMC performance on
> Qualcomm eMMC controllers and in generally nudge us forward on the
> path of allowing some devices to be in strict mode and others to be in
> non-strict mode.

So if I understand it right, this patch-set wants a per-device decision
about setting dma-mode to strict vs. non-strict.

I think we should get to the reason why strict mode is used by default
first. Is the default on ARM platforms to use iommu-strict mode by
default and if so, why?

The x86 IOMMUs use non-strict mode by default (yes, it is a security
trade-off).

Regards,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
