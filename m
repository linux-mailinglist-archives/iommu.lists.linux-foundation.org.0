Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB22E8669
	for <lists.iommu@lfdr.de>; Tue, 29 Oct 2019 12:16:08 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 50320135E;
	Tue, 29 Oct 2019 11:16:04 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 62ADE949
	for <iommu@lists.linux-foundation.org>;
	Tue, 29 Oct 2019 11:16:03 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id D48C842D
	for <iommu@lists.linux-foundation.org>;
	Tue, 29 Oct 2019 11:16:00 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 12913208E3;
	Tue, 29 Oct 2019 11:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1572347760;
	bh=PYpYmLCcRCDnvoNd2S0sMHcaEM2JronWu9CsKftbO3I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GdaMUmmgMjWuXCjwK0dWZlcoWZbdkss1hf/IPKcAItun5DvAeYWYvYEXepIKuV8F4
	Cgj6BmO5LCR5kVQSqH6TeJrA5sMtyubLtUhcJCViQ3HQZ9x8ffrdD48QttQIxJTdvs
	cKuoCU3Lo8JRJ8savTdPFUcs8+VjcCEB/d/GTobo=
Date: Tue, 29 Oct 2019 11:15:56 +0000
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v2] iommu/arm-smmu: fix "hang" when games exit
Message-ID: <20191029111555.GF11590@willie-the-truck>
References: <418d8426-f299-1269-2b2e-f86677cf22c2@arm.com>
	<20191007204906.19571-1-robdclark@gmail.com>
	<20191028222042.GB8532@willie-the-truck>
	<CAJs_Fx7zRWsTPiAg0PFt+8nJPpHpzSkxW6XMMJwozVO6vyB78A@mail.gmail.com>
	<e3fc88d9-4934-0227-d9c7-b1cb37a8811e@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e3fc88d9-4934-0227-d9c7-b1cb37a8811e@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Rob Clark <robdclark@chromium.org>, iommu@lists.linux-foundation.org,
	open list <linux-kernel@vger.kernel.org>,
	freedreno <freedreno@lists.freedesktop.org>,
	"moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>
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

On Mon, Oct 28, 2019 at 10:51:53PM +0000, Robin Murphy wrote:
> On 2019-10-28 10:38 pm, Rob Clark wrote:
> > On Mon, Oct 28, 2019 at 3:20 PM Will Deacon <will@kernel.org> wrote:
> > > On Mon, Oct 07, 2019 at 01:49:06PM -0700, Rob Clark wrote:
> > > > From: Rob Clark <robdclark@chromium.org>
> > > > 
> > > > When games, browser, or anything using a lot of GPU buffers exits, there
> > > > can be many hundreds or thousands of buffers to unmap and free.  If the
> > > > GPU is otherwise suspended, this can cause arm-smmu to resume/suspend
> > > > for each buffer, resulting 5-10 seconds worth of reprogramming the
> > > > context bank (arm_smmu_write_context_bank()/arm_smmu_write_s2cr()/etc).
> > > > To the user it would appear that the system just locked up.
> > > > 
> > > > A simple solution is to use pm_runtime_put_autosuspend() instead, so we
> > > > don't immediately suspend the SMMU device.
> > > 
> > > Please can you reword the subject to be a bit more useful? The commit
> > > message is great, but the subject is a bit like "fix bug in code" to me.
> > 
> > yeah, not the best $subject, but I wasn't quite sure how to fit
> > something better in a reasonable # of chars.. maybe something like:
> > "iommu/arm-smmu: optimize unmap but avoiding toggling runpm state"?
> 
> FWIW, I'd be inclined to frame it as something like "avoid pathological RPM
> behaviour for unmaps".

LGTM!

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
