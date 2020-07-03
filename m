Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 77562213A06
	for <lists.iommu@lfdr.de>; Fri,  3 Jul 2020 14:24:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2A6DD88144;
	Fri,  3 Jul 2020 12:24:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y+Klm6GW8Xm1; Fri,  3 Jul 2020 12:24:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 583FB873B6;
	Fri,  3 Jul 2020 12:24:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 27640C08A8;
	Fri,  3 Jul 2020 12:24:06 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E27B0C0733
 for <iommu@lists.linux-foundation.org>; Fri,  3 Jul 2020 12:24:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 7F0DE87DEE
 for <iommu@lists.linux-foundation.org>; Fri,  3 Jul 2020 12:23:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gFamUVhO6Zqp for <iommu@lists.linux-foundation.org>;
 Fri,  3 Jul 2020 12:23:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id E6D2C87D5B
 for <iommu@lists.linux-foundation.org>; Fri,  3 Jul 2020 12:23:49 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3873A20826;
 Fri,  3 Jul 2020 12:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593779029;
 bh=vd4djFKYd31yL3oupRmWE2lyv4ORZWuNlPzVgna7t2M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WHs4GUDV2uRZU81RtdyMa3DLQpqpW5ngrnYAQ1k44tF5fi8qTpHzmkCTSxkOaQfsU
 ntwU/A6Q0tZmFwA2MHJT/daqj1pZj6k2/Gzr7OZ4f0ZTXz1sxwbv7GuoFKbK7+n9lU
 9INFciuKTMlV0H2WvUhE6AI4h2hCgkVbDcetQZXk=
Date: Fri, 3 Jul 2020 13:23:44 +0100
From: Will Deacon <will@kernel.org>
To: John Stultz <john.stultz@linaro.org>
Subject: Re: [RFC][PATCH 5/5] firmware: QCOM_SCM: Allow qcom_scm driver to be
 loadable as a permenent module
Message-ID: <20200703122343.GB18652@willie-the-truck>
References: <20200616061338.109499-1-john.stultz@linaro.org>
 <20200616061338.109499-6-john.stultz@linaro.org>
 <0be86735238a0f8b0c25934e2ed39eee@kernel.org>
 <CALAqxLUZBdiLBRcp1GW9rGxt1KhgNVQ86MuPXZcXdx2wFLZk6w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CALAqxLUZBdiLBRcp1GW9rGxt1KhgNVQ86MuPXZcXdx2wFLZk6w@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Jason Cooper <jason@lakedaemon.net>, Saravana Kannan <saravanak@google.com>,
 Marc Zyngier <maz@kernel.org>, lkml <linux-kernel@vger.kernel.org>,
 Lina Iyer <ilina@codeaurora.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-gpio@vger.kernel.org, iommu@lists.linux-foundation.org,
 Andy Gross <agross@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, Linus Walleij <linus.walleij@linaro.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, Todd Kjos <tkjos@google.com>
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

On Tue, Jun 16, 2020 at 01:52:32PM -0700, John Stultz wrote:
> On Tue, Jun 16, 2020 at 12:55 AM Marc Zyngier <maz@kernel.org> wrote:
> > On 2020-06-16 07:13, John Stultz wrote:
> > > diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
> > > index b510f67dfa49..714893535dd2 100644
> > > --- a/drivers/iommu/Kconfig
> > > +++ b/drivers/iommu/Kconfig
> > > @@ -381,6 +381,7 @@ config SPAPR_TCE_IOMMU
> > >  config ARM_SMMU
> > >       tristate "ARM Ltd. System MMU (SMMU) Support"
> > >       depends on (ARM64 || ARM || (COMPILE_TEST && !GENERIC_ATOMIC64)) &&
> > > MMU
> > > +     depends on QCOM_SCM || !QCOM_SCM #if QCOM_SCM=m this can't be =y
> >
> > This looks a bit ugly. Could you explain why we need this at the SMMU
> > level? I'd have expected the dependency to flow the other way around...
> 
> Yea, so the arm-smmu-qcom.c file calls directly into the qcom-scm code
> via qcom_scm_qsmmu500_wait_safe_toggle()
>   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/iommu/arm-smmu-qcom.c?h=v5.8-rc1#n44
> 
> So if ARM_SMMU=y and QCOM_SCM=m we get:
> drivers/iommu/arm-smmu-qcom.o: In function `qcom_smmu500_reset':
> arm-smmu-qcom.c:(.text+0xb4): undefined reference to
> `qcom_scm_qsmmu500_wait_safe_toggle'
> 
> Do you have a suggestion for an alternative approach?

Can you use symbol_get() or something like that? How are module dependencies
handled by other drivers?

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
