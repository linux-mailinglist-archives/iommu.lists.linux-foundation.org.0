Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id A587D32E53
	for <lists.iommu@lfdr.de>; Mon,  3 Jun 2019 13:13:13 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id B758ACDD;
	Mon,  3 Jun 2019 11:13:11 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 7C0FB7A4
	for <iommu@lists.linux-foundation.org>;
	Mon,  3 Jun 2019 11:13:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id A2BEA5D3
	for <iommu@lists.linux-foundation.org>;
	Mon,  3 Jun 2019 11:13:09 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id 3C10060E3E; Mon,  3 Jun 2019 11:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1559560389;
	bh=/IlSWA5wpDjI/sKkHaCYMCy090nAOhZQl32CPwJM4g8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=SCQ9naxMTGrH7BZgl2WeRG4y31Whr8r56ex54AA+QD7bqxk0kuJmpYwDDxPhU9dc+
	4tTeMrJP4RTICBZp/uaxxh/8mt16xesIUWEvVyqK/ZKLMeLDMft/6mltMBRMxvPgDq
	2/I7tokofd2b8w0eGRgq+/wY6/1r/BXGgtAhRJXQ=
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
	[209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: vivek.gautam@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 1B7D960E75
	for <iommu@lists.linux-foundation.org>;
	Mon,  3 Jun 2019 11:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1559560386;
	bh=/IlSWA5wpDjI/sKkHaCYMCy090nAOhZQl32CPwJM4g8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=n45txtAbmQNPgtV6CYMnUqZQ5/qIY/YXcLBX/9Rn6GDVuaFRTeAVkW95mw546exXA
	S7skIcmnQZqW/EdyfF1XTjLa8towvijH5xIAZ+RbHHkxzJm5OSUBaNpf5gEW2B+v0B
	fo8Sy2HQ+hEkw47uX/GGR+lSrSl4vSHEhTPqg3E4=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 1B7D960E75
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=vivek.gautam@codeaurora.org
Received: by mail-ed1-f42.google.com with SMTP id x25so14180398eds.8
	for <iommu@lists.linux-foundation.org>;
	Mon, 03 Jun 2019 04:13:05 -0700 (PDT)
X-Gm-Message-State: APjAAAUZ0rT0uVBz8+eHOpu9y+Q29JtuuDE+m/dmTVOQRy9+duWFzT85
	4sbM9fWIdKfSlfkStnzxlDcgA8DXVB68YppF77A=
X-Google-Smtp-Source: APXvYqwz0OzivfIc9TQt3SmjHP6w101FDHO0rgn8Bswqzxzi435rHzOFE7jhf2ZFUfeOgaUgrj9DL+8Z1wbZKJsK44c=
X-Received: by 2002:a17:906:12ca:: with SMTP id
	l10mr23390918ejb.2.1559560384580; 
	Mon, 03 Jun 2019 04:13:04 -0700 (PDT)
MIME-Version: 1.0
References: <20181201165348.24140-1-robdclark@gmail.com>
	<CAL_JsqJmPqis46Un91QyhXgdrVtfATMP_hTp6wSeSAfc8MLFfw@mail.gmail.com>
	<CAF6AEGs9Nsft8ofZkGz_yWBPBC+prh8dBSkJ4PJr8yk2c5FMdQ@mail.gmail.com>
	<CAF6AEGt-dhbQS5zZCNVTLT57OiUwO0RiP5bawTSu2RKZ-7W-aw@mail.gmail.com>
	<CAAFQd5BdrJFL5LKK8O5NPDKWfFgkTX_JU-jU3giEz33tj-jwCA@mail.gmail.com>
	<4864dc3e-6e04-43e5-32c8-2cf5a0705fe5@codeaurora.org>
	<CAF6AEGuFyk1DJWUcQTnW=xsEUhYTYJccjzHJFxvipK4M8UdrUA@mail.gmail.com>
In-Reply-To: <CAF6AEGuFyk1DJWUcQTnW=xsEUhYTYJccjzHJFxvipK4M8UdrUA@mail.gmail.com>
From: Vivek Gautam <vivek.gautam@codeaurora.org>
Date: Mon, 3 Jun 2019 16:42:53 +0530
X-Gmail-Original-Message-ID: <CAFp+6iGexVjbak8RQhEQNPp5cV8PK2ubTNNCMyaFPqdTGAbJ0A@mail.gmail.com>
Message-ID: <CAFp+6iGexVjbak8RQhEQNPp5cV8PK2ubTNNCMyaFPqdTGAbJ0A@mail.gmail.com>
Subject: Re: [PATCH] of/device: add blacklist for iommu dma_ops
To: Rob Clark <robdclark@gmail.com>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
	<devicetree@vger.kernel.org>, Archit Taneja <architt@codeaurora.org>,
	David Airlie <airlied@linux.ie>,
	freedreno <freedreno@lists.freedesktop.org>,
	Will Deacon <will.deacon@arm.com>, Doug Anderson <dianders@chromium.org>,
	dri-devel <dri-devel@lists.freedesktop.org>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Linux IOMMU <iommu@lists.linux-foundation.org>,
	Rob Herring <robh+dt@kernel.org>, Sean Paul <seanpaul@chromium.org>,
	Daniel Vetter <daniel@ffwll.ch>,
	linux-arm-msm <linux-arm-msm@vger.kernel.org>,
	Frank Rowand <frowand.list@gmail.com>, Christoph Hellwig <hch@lst.de>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
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

On Mon, Jun 3, 2019 at 4:14 PM Rob Clark <robdclark@gmail.com> wrote:
>
> On Mon, Jun 3, 2019 at 12:57 AM Vivek Gautam
> <vivek.gautam@codeaurora.org> wrote:
> >
> >
> >
> > On 6/3/2019 11:50 AM, Tomasz Figa wrote:
> > > On Mon, Jun 3, 2019 at 4:40 AM Rob Clark <robdclark@gmail.com> wrote:
> > >> On Fri, May 10, 2019 at 7:35 AM Rob Clark <robdclark@gmail.com> wrote:
> > >>> On Tue, Dec 4, 2018 at 2:29 PM Rob Herring <robh+dt@kernel.org> wrote:
> > >>>> On Sat, Dec 1, 2018 at 10:54 AM Rob Clark <robdclark@gmail.com> wrote:
> > >>>>> This solves a problem we see with drm/msm, caused by getting
> > >>>>> iommu_dma_ops while we attach our own domain and manage it directly at
> > >>>>> the iommu API level:
> > >>>>>
> > >>>>>    [0000000000000038] user address but active_mm is swapper
> > >>>>>    Internal error: Oops: 96000005 [#1] PREEMPT SMP
> > >>>>>    Modules linked in:
> > >>>>>    CPU: 7 PID: 70 Comm: kworker/7:1 Tainted: G        W         4.19.3 #90
> > >>>>>    Hardware name: xxx (DT)
> > >>>>>    Workqueue: events deferred_probe_work_func
> > >>>>>    pstate: 80c00009 (Nzcv daif +PAN +UAO)
> > >>>>>    pc : iommu_dma_map_sg+0x7c/0x2c8
> > >>>>>    lr : iommu_dma_map_sg+0x40/0x2c8
> > >>>>>    sp : ffffff80095eb4f0
> > >>>>>    x29: ffffff80095eb4f0 x28: 0000000000000000
> > >>>>>    x27: ffffffc0f9431578 x26: 0000000000000000
> > >>>>>    x25: 00000000ffffffff x24: 0000000000000003
> > >>>>>    x23: 0000000000000001 x22: ffffffc0fa9ac010
> > >>>>>    x21: 0000000000000000 x20: ffffffc0fab40980
> > >>>>>    x19: ffffffc0fab40980 x18: 0000000000000003
> > >>>>>    x17: 00000000000001c4 x16: 0000000000000007
> > >>>>>    x15: 000000000000000e x14: ffffffffffffffff
> > >>>>>    x13: ffff000000000000 x12: 0000000000000028
> > >>>>>    x11: 0101010101010101 x10: 7f7f7f7f7f7f7f7f
> > >>>>>    x9 : 0000000000000000 x8 : ffffffc0fab409a0
> > >>>>>    x7 : 0000000000000000 x6 : 0000000000000002
> > >>>>>    x5 : 0000000100000000 x4 : 0000000000000000
> > >>>>>    x3 : 0000000000000001 x2 : 0000000000000002
> > >>>>>    x1 : ffffffc0f9431578 x0 : 0000000000000000
> > >>>>>    Process kworker/7:1 (pid: 70, stack limit = 0x0000000017d08ffb)
> > >>>>>    Call trace:
> > >>>>>     iommu_dma_map_sg+0x7c/0x2c8
> > >>>>>     __iommu_map_sg_attrs+0x70/0x84
> > >>>>>     get_pages+0x170/0x1e8
> > >>>>>     msm_gem_get_iova+0x8c/0x128
> > >>>>>     _msm_gem_kernel_new+0x6c/0xc8
> > >>>>>     msm_gem_kernel_new+0x4c/0x58
> > >>>>>     dsi_tx_buf_alloc_6g+0x4c/0x8c
> > >>>>>     msm_dsi_host_modeset_init+0xc8/0x108
> > >>>>>     msm_dsi_modeset_init+0x54/0x18c
> > >>>>>     _dpu_kms_drm_obj_init+0x430/0x474
> > >>>>>     dpu_kms_hw_init+0x5f8/0x6b4
> > >>>>>     msm_drm_bind+0x360/0x6c8
> > >>>>>     try_to_bring_up_master.part.7+0x28/0x70
> > >>>>>     component_master_add_with_match+0xe8/0x124
> > >>>>>     msm_pdev_probe+0x294/0x2b4
> > >>>>>     platform_drv_probe+0x58/0xa4
> > >>>>>     really_probe+0x150/0x294
> > >>>>>     driver_probe_device+0xac/0xe8
> > >>>>>     __device_attach_driver+0xa4/0xb4
> > >>>>>     bus_for_each_drv+0x98/0xc8
> > >>>>>     __device_attach+0xac/0x12c
> > >>>>>     device_initial_probe+0x24/0x30
> > >>>>>     bus_probe_device+0x38/0x98
> > >>>>>     deferred_probe_work_func+0x78/0xa4
> > >>>>>     process_one_work+0x24c/0x3dc
> > >>>>>     worker_thread+0x280/0x360
> > >>>>>     kthread+0x134/0x13c
> > >>>>>     ret_from_fork+0x10/0x18
> > >>>>>    Code: d2800004 91000725 6b17039f 5400048a (f9401f40)
> > >>>>>    ---[ end trace f22dda57f3648e2c ]---
> > >>>>>    Kernel panic - not syncing: Fatal exception
> > >>>>>    SMP: stopping secondary CPUs
> > >>>>>    Kernel Offset: disabled
> > >>>>>    CPU features: 0x0,22802a18
> > >>>>>    Memory Limit: none
> > >>>>>
> > >>>>> The problem is that when drm/msm does it's own iommu_attach_device(),
> > >>>>> now the domain returned by iommu_get_domain_for_dev() is drm/msm's
> > >>>>> domain, and it doesn't have domain->iova_cookie.
> > >>>>>
> > >>>>> We kind of avoided this problem prior to sdm845/dpu because the iommu
> > >>>>> was attached to the mdp node in dt, which is a child of the toplevel
> > >>>>> mdss node (which corresponds to the dev passed in dma_map_sg()).  But
> > >>>>> with sdm845, now the iommu is attached at the mdss level so we hit the
> > >>>>> iommu_dma_ops in dma_map_sg().
> > >>>>>
> > >>>>> But auto allocating/attaching a domain before the driver is probed was
> > >>>>> already a blocking problem for enabling per-context pagetables for the
> > >>>>> GPU.  This problem is also now solved with this patch.
> > >>>>>
> > >>>>> Fixes: 97890ba9289c dma-mapping: detect and configure IOMMU in of_dma_configure
> > >>>>> Tested-by: Douglas Anderson <dianders@chromium.org>
> > >>>>> Signed-off-by: Rob Clark <robdclark@gmail.com>
> > >>>>> ---
> > >>>>> This is an alternative/replacement for [1].  What it lacks in elegance
> > >>>>> it makes up for in practicality ;-)
> > >>>>>
> > >>>>> [1] https://patchwork.freedesktop.org/patch/264930/
> > >>>>>
> > >>>>>   drivers/of/device.c | 22 ++++++++++++++++++++++
> > >>>>>   1 file changed, 22 insertions(+)
> > >>>>>
> > >>>>> diff --git a/drivers/of/device.c b/drivers/of/device.c
> > >>>>> index 5957cd4fa262..15ffee00fb22 100644
> > >>>>> --- a/drivers/of/device.c
> > >>>>> +++ b/drivers/of/device.c
> > >>>>> @@ -72,6 +72,14 @@ int of_device_add(struct platform_device *ofdev)
> > >>>>>          return device_add(&ofdev->dev);
> > >>>>>   }
> > >>>>>
> > >>>>> +static const struct of_device_id iommu_blacklist[] = {
> > >>>>> +       { .compatible = "qcom,mdp4" },
> > >>>>> +       { .compatible = "qcom,mdss" },
> > >>>>> +       { .compatible = "qcom,sdm845-mdss" },
> > >>>>> +       { .compatible = "qcom,adreno" },
> > >>>>> +       {}
> > >>>>> +};
> > >>>> Not completely clear to whether this is still needed or not, but this
> > >>>> really won't scale. Why can't the driver for these devices override
> > >>>> whatever has been setup by default?
> > >>>>
> > >>> fwiw, at the moment it is not needed, but it will become needed again
> > >>> to implement per-context pagetables (although I suppose for this we
> > >>> only need to blacklist qcom,adreno and not also the display nodes).
> > >> So, another case I've come across, on the display side.. I'm working
> > >> on handling the case where bootloader enables display (and takes iommu
> > >> out of reset).. as soon as DMA domain gets attached we get iommu
> > >> faults, because bootloader has already configured display for scanout.
> > >> Unfortunately this all happens before actual driver is probed and has
> > >> a chance to intervene.
> >
> > Things are bad for MTP sdm845 too where the bootloader sets up iommu to
> > display splash screen, and when the kernel resets the iommu, the mappings go
> > for a toss resulting in fatal faults.
> > Bjorn was working on something recently to address this. Adding him to
> > the thread.
> >
>
> yeah, I was hitting it on the yoga c630 laptop, but it is the identical problem.
>
> We'd worked around it so far with a hack in arm-smmu to temporarily
> ioremap the display controller block and disable INTF1, which is
> *defn* not a good solution ;-)

Right, but this doesn't always work for MTP. I believe Bjorn has something
more inline with downstream.

Regards
>
> BR,
> -R
>
> >
> > Best regards
> > Vivek
> >
> > >> It's rather unfortunate that we tried to be clever rather than just
> > >> making drivers call some function to opt-in to the hookup of dma iommu
> > >> ops :-(
> > > I think it still works for the 90% of cases and if 10% needs some
> > > explicit work in the drivers, that's better than requiring 100% of the
> > > drivers to do things manually.
> > >
> > > Adding Marek who had the same problem on Exynos.
> > >
> > > Best regards,
> > > Tomasz
> > >
> > >> BR,
> > >> -R
> > >>
> > >>> The reason is that in the current state the core code creates the
> > >>> first domain before the driver has a chance to intervene and tell it
> > >>> not to.  And this results that driver ends up using a different
> > >>> context bank on the iommu than what the firmware expects.
> > >>>
> > >>> I guess the alternative is to put some property in DT.. but that
> > >>> doesn't really feel right.  I guess there aren't really many (or any?)
> > >>> other drivers that have this specific problem, so I don't really
> > >>> expect it to be a scaling problem.
> > >>>
> > >>> Yeah, it's a bit ugly, but I'll take a small ugly working hack, over
> > >>> elegant but non-working any day ;-)... but if someone has a better
> > >>> idea then I'm all ears.
> > >>>
> > >>> BR,
> > >>> -R
> >
> _______________________________________________
> iommu mailing list
> iommu@lists.linux-foundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/iommu



-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
