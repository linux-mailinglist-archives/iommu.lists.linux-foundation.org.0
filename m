Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C2F559A84
	for <lists.iommu@lfdr.de>; Fri, 24 Jun 2022 15:41:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5FEA141781;
	Fri, 24 Jun 2022 13:41:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5FEA141781
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fRgIK/mn
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aag87nvm68xK; Fri, 24 Jun 2022 13:41:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id B3158425B1;
	Fri, 24 Jun 2022 13:41:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B3158425B1
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 72FABC0081;
	Fri, 24 Jun 2022 13:41:11 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 46992C002D
 for <iommu@lists.linux-foundation.org>; Fri, 24 Jun 2022 13:41:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1FD5583F1C
 for <iommu@lists.linux-foundation.org>; Fri, 24 Jun 2022 13:41:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1FD5583F1C
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=fRgIK/mn
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EbpmVYQul6mz for <iommu@lists.linux-foundation.org>;
 Fri, 24 Jun 2022 13:41:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A65918305C
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A65918305C
 for <iommu@lists.linux-foundation.org>; Fri, 24 Jun 2022 13:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656078067;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KteV45zEkxYjkxhkm4g2UjRR3BlFLh33bTnUm010RRw=;
 b=fRgIK/mntylZBGJ5GGL2iO7jheZv1MKn4oc9iBD+1ljtx+2WHlwnq3z102+fzd6zyUvRqJ
 LxyHouwxJl573+DY0EeTsAWu33ODgDq29vxqHQmTDAz3/cSE1dNBEA+NWGxUw3IK8AR4HY
 RhAD5qN+u7NuUaGZlPtVUOcOKYGFQKo=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-66-a59kMckmP-2iUhy4LFp-nw-1; Fri, 24 Jun 2022 09:41:06 -0400
X-MC-Unique: a59kMckmP-2iUhy4LFp-nw-1
Received: by mail-pl1-f198.google.com with SMTP id
 a10-20020a170902ecca00b0016a50049af0so1331370plh.10
 for <iommu@lists.linux-foundation.org>; Fri, 24 Jun 2022 06:41:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=KteV45zEkxYjkxhkm4g2UjRR3BlFLh33bTnUm010RRw=;
 b=ou7utR0FTQ7N+3iVEP0A6Tec4wWNhwqXh9mINslBv5W+iydv6slnoZ0MeUyP0iRJHm
 54WqRW43Pcwlu1corll4d4iJQ08xE3GM2AA8wrQbjkkQTj9D71YbMHqv/cR2ZdcObsIp
 9i25AKXHmVAl534y54crWp9PqWAh21ICVZuNPPj2WpK2GtLMurkrAtYUbQQR6uYs34JY
 dzou3f2sWZ9HCVSl5HOVSOSTJAxfUV4xOJ8lazxEIbbNpWJ1552USNYx6RSY7ai7pkAL
 +cJr+8+lV2ehJntuL1noQSfYKWFQpQV+47JtJ4e2GckJIYKNYBZRBpt/+NnA3LxaerhI
 ecJw==
X-Gm-Message-State: AJIora+rN0oece+/JJL206E5aTM/b6IPYVq0qp/dNGb9AWg3QzJc3bAb
 E+lJdzbLlrhukMoL+wp65Doe/eWiuheyCvDIqZ2I7g/6vUxP1JlB03S3VMF8l0VxfewOmlS8Kls
 SsZJYOHm9cb4qrLJuxljlFOjXDsQwoA==
X-Received: by 2002:a17:902:ef47:b0:169:a2a7:94cf with SMTP id
 e7-20020a170902ef4700b00169a2a794cfmr40230459plx.143.1656078064624; 
 Fri, 24 Jun 2022 06:41:04 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u5VCGAgNDM1n0hA3deVNGsB1Gs3/PjL1/K7rb+QC3L5TiyNJcWlOVfMUttxpTCsWprotPLcQ==
X-Received: by 2002:a17:902:ef47:b0:169:a2a7:94cf with SMTP id
 e7-20020a170902ef4700b00169a2a794cfmr40230426plx.143.1656078064129; 
 Fri, 24 Jun 2022 06:41:04 -0700 (PDT)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
 by smtp.gmail.com with ESMTPSA id
 y17-20020a1709027c9100b0016648412514sm1812516pll.188.2022.06.24.06.41.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jun 2022 06:41:03 -0700 (PDT)
Date: Fri, 24 Jun 2022 06:41:02 -0700
From: Jerry Snitselaar <jsnitsel@redhat.com>
To: Baolu Lu <baolu.lu@linux.intel.com>, Fenghua Yu <fenghua.yu@intel.com>
Subject: Re: iommu_sva_bind_device question
Message-ID: <20220624134102.qxid72gqghjhyozn@cantor>
References: <20220623170232.6whonfjuh3m5vcoy@cantor>
 <6639b21c-1544-a025-4da5-219a1608f06e@linux.intel.com>
 <20220624011446.2bexm4sjo2vabay5@cantor>
 <552074ff-fd32-8cdb-cc10-1d71319c71db@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <552074ff-fd32-8cdb-cc10-1d71319c71db@linux.intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnitsel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: dmaengine@vger.kernel.org, iommu@lists.linux-foundation.org,
 Dave Jiang <dave.jiang@intel.com>
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

On Fri, Jun 24, 2022 at 09:43:30AM +0800, Baolu Lu wrote:
> On 2022/6/24 09:14, Jerry Snitselaar wrote:
> > On Fri, Jun 24, 2022 at 08:55:08AM +0800, Baolu Lu wrote:
> > > On 2022/6/24 01:02, Jerry Snitselaar wrote:
> > > > Hi Baolu & Dave,
> > > > 
> > > > I noticed last night that on a Sapphire Rapids system if you boot without
> > > > intel_iommu=on, the idxd driver will crash during probe in iommu_sva_bind_device().
> > > > Should there be a sanity check before calling dev_iommu_ops(), or is the expectation
> > > > that the caller would verify it is safe to call? This seemed to be uncovered by
> > > > the combination of 3f6634d997db ("iommu: Use right way to retrieve iommu_ops"), and
> > > > 42a1b73852c4 ("dmaengine: idxd: Separate user and kernel pasid enabling").
> > > > 
> > > > [   21.423729] BUG: kernel NULL pointer dereference, address: 0000000000000038
> > > > [   21.445108] #PF: supervisor read access in kernel mode
> > > > [   21.450912] #PF: error_code(0x0000) - not-present page
> > > > [   21.456706] PGD 0
> > > > [   21.459047] Oops: 0000 [#1] PREEMPT SMP NOPTI
> > > > [   21.464004] CPU: 0 PID: 1420 Comm: kworker/0:3 Not tainted 5.19.0-0.rc3.27.eln120.x86_64 #1
> > > > [   21.464011] Hardware name: Intel Corporation EAGLESTREAM/EAGLESTREAM, BIOS EGSDCRB1.SYS.0067.D12.2110190954 10/19/2021
> > > > [   21.464015] Workqueue: events work_for_cpu_fn
> > > > [   21.464030] RIP: 0010:iommu_sva_bind_device+0x1d/0xe0
> > > > [   21.464046] Code: c3 cc 66 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 41 57 41 56 49 89 d6 41 55 41 54 55 53 48 83 ec 08 48 8b 87 d8 02 00 00 <48> 8b 40 38 48 8b 50 10 48 83 7a 70 00 48 89 14 24 0f 84 91 00 00
> > > > [   21.464050] RSP: 0018:ff7245d9096b7db8 EFLAGS: 00010296
> > > > [   21.464054] RAX: 0000000000000000 RBX: ff1eadeec8a51000 RCX: 0000000000000000
> > > > [   21.464058] RDX: ff7245d9096b7e24 RSI: 0000000000000000 RDI: ff1eadeec8a510d0
> > > > [   21.464060] RBP: ff1eadeec8a51000 R08: ffffffffb1a12300 R09: ff1eadffbfce25b4
> > > > [   21.464062] R10: ffffffffffffffff R11: 0000000000000038 R12: ffffffffc09f8000
> > > > [   21.464065] R13: ff1eadeec8a510d0 R14: ff7245d9096b7e24 R15: ff1eaddf54429000
> > > > [   21.464067] FS:  0000000000000000(0000) GS:ff1eadee7f600000(0000) knlGS:0000000000000000
> > > > [   21.464070] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > > > [   21.464072] CR2: 0000000000000038 CR3: 00000008c0e10006 CR4: 0000000000771ef0
> > > > [   21.464074] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> > > > [   21.464076] DR3: 0000000000000000 DR6: 00000000fffe07f0 DR7: 0000000000000400
> > > > [   21.464078] PKRU: 55555554
> > > > [   21.464079] Call Trace:
> > > > [   21.464083]  <TASK>
> > > > [   21.464092]  idxd_pci_probe+0x259/0x1070 [idxd]
> > > > [   21.464121]  local_pci_probe+0x3e/0x80
> > > > [   21.464132]  work_for_cpu_fn+0x13/0x20
> > > > [   21.464136]  process_one_work+0x1c4/0x380
> > > > [   21.464143]  worker_thread+0x1ab/0x380
> > > > [   21.464147]  ? _raw_spin_lock_irqsave+0x23/0x50
> > > > [   21.464158]  ? process_one_work+0x380/0x380
> > > > [   21.464161]  kthread+0xe6/0x110
> > > > [   21.464168]  ? kthread_complete_and_exit+0x20/0x20
> > > > [   21.464172]  ret_from_fork+0x1f/0x30
> > > > 
> > > > I figure either there needs to be a check in iommu_sva_bind_device, or
> > > > idxd needs to check in idxd_enable_system_pasid that that
> > > > idxd->pdev->dev.iommu is not null before it tries calling iommu_sva_bind_device.
> > > 
> > > As documented around the iommu_sva_bind_device() interface:
> > > 
> > >   * iommu_dev_enable_feature(dev, IOMMU_DEV_FEAT_SVA) must be called first,
> > > to
> > >   * initialize the required SVA features.
> > > 
> > > idxd->pdev->dev.iommu should be checked in there.
> > > 
> > > Dave, any thoughts?
> > > 
> > > Best regards,
> > > baolu
> > 
> > Duh, sorry I missed that in the comments.
> > 
> > It calls iommu_dev_enable_feature(), but then goes into code that
> > calls iommu_sva_bind_device whether or not iommu_dev_enable_feature()
> > fails.
> > 
> > You also will get the following warning if you don't have scalable
> > mode enabled (either not enabled by default, or if enabled by default
> > and passed intel_iommu=on,sm_off):
> 
> If scalable mode is disabled, iommu_dev_enable_feature(IOMMU_SVA) will
> return failure, hence driver should not call iommu_sva_bind_device().
> I guess below will disappear if above is fixed in the idxd driver.
> 
> Best regards,
> baolu
>

It looks like there was a recent maintainer change, and Fenghua is now
the maintainer. Fenghua thoughts on this? With 42a1b73852c4
("dmaengine: idxd: Separate user and kernel pasid enabling") the code
no longer depends on iommu_dev_feature_enable succeeding. Testing with
something like this works (ran dmatest without sm_on, and
dsa_user_test_runner.sh with sm_on, plus booting with various
intel_iommu= combinations):

diff --git a/drivers/dma/idxd/init.c b/drivers/dma/idxd/init.c
index 355fb3ef4cbf..5b49fd5c1e25 100644
--- a/drivers/dma/idxd/init.c
+++ b/drivers/dma/idxd/init.c
@@ -514,13 +514,14 @@ static int idxd_probe(struct idxd_device *idxd)
        if (IS_ENABLED(CONFIG_INTEL_IDXD_SVM) && sva) {
                if (iommu_dev_enable_feature(dev, IOMMU_DEV_FEAT_SVA))
                        dev_warn(dev, "Unable to turn on user SVA feature.\n");
-               else
+               else {
                        set_bit(IDXD_FLAG_USER_PASID_ENABLED, &idxd->flags);

-               if (idxd_enable_system_pasid(idxd))
-                       dev_warn(dev, "No in-kernel DMA with PASID.\n");
-               else
-                       set_bit(IDXD_FLAG_PASID_ENABLED, &idxd->flags);
+                       if (idxd_enable_system_pasid(idxd))
+                               dev_warn(dev, "No in-kernel DMA with PASID.\n");
+                       else
+                               set_bit(IDXD_FLAG_PASID_ENABLED, &idxd->flags);
+               }
        } else if (!sva) {
                dev_warn(dev, "User forced SVA off via module param.\n");
        }

The commit description is a bit confusing, because it talks about there
being no dependency, but ties user pasid to enabling/disabling the SVA
feature, which system pasid would depend on as well.

Regards,
Jerry

> > 
> > [   24.645784] idxd 0000:6a:01.0: enabling device (0144 -> 0146)
> > [   24.645871] idxd 0000:6a:01.0: Unable to turn on user SVA feature.
> > [   24.645932] ------------[ cut here ]------------
> > [   24.645935] WARNING: CPU: 0 PID: 422 at drivers/iommu/intel/pasid.c:253 intel_pasid_get_entry.isra.0+0xcd/0xe0
> > [   24.675872] Modules linked in: intel_uncore(+) drm_ttm_helper isst_if_mbox_pci(+) idxd(+) snd i2c_i801(+) isst_if_mmio ttm isst_if_common mei fjes(+) soundcore intel_vsec i2c_ismt i2c_smbus idxd_bus ipmi_ssif acpi_ipmi ipmi_si acpi_pad acpi_power_meter pfr_telemetry pfr_update vfat fat fuse xfs crct10dif_pclmul crc32_pclmul crc32c_intel ghash_clmulni_intel igc wmi pinctrl_emmitsburg ipmi_devintf ipmi_msghandler
> > [   24.716612] CPU: 0 PID: 422 Comm: kworker/0:2 Not tainted 5.19.0-0.rc3.27.eln120.x86_64 #1
> > [   24.716621] Hardware name: Intel Corporation EAGLESTREAM/EAGLESTREAM, BIOS EGSDCRB1.SYS.0067.D12.2110190954 10/19/2021
> > [   24.716625] Workqueue: events work_for_cpu_fn
> > [   24.716645] RIP: 0010:intel_pasid_get_entry.isra.0+0xcd/0xe0
> > [   24.716656] Code: a9 d1 ff ff 48 89 c7 48 85 c0 75 9e 31 c0 5b 5d 41 5c 41 5d c3 cc 41 83 e4 3f 5b 5d 49 c1 e4 06 4a 8d 04 27 41 5c 41 5d c3 cc <0f> 0b 31 c0 eb de 48 8b 05 e6 dd 59 01 eb 87 0f 1f 40 00 0f 1f 44
> > [   24.716664] RSP: 0018:ff848155c79bfd00 EFLAGS: 00010046
> > [   24.716671] RAX: 0000000000000206 RBX: ff3deaf807bfdcc0 RCX: 0000000000000001
> > [   24.716677] RDX: 0000000000000000 RSI: 0000000000000001 RDI: ff3deb0789f53240
> > [   24.716682] RBP: ff3deb0789f53780 R08: 0000000000000001 R09: 0000000000000003
> > [   24.716688] R10: ff848155c79bfcf8 R11: 0000000000000000 R12: 0000000000000003
> > [   24.716693] R13: 0000000000000001 R14: 0000000000000001 R15: ffffffff84e10000
> > [   24.716700] FS:  0000000000000000(0000) GS:ff3deb073f600000(0000) knlGS:0000000000000000
> > [   24.716705] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > [   24.716709] CR2: 0000558a19e81c58 CR3: 0000000108252005 CR4: 0000000000771ef0
> > [   24.716714] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> > [   24.716719] DR3: 0000000000000000 DR6: 00000000fffe07f0 DR7: 0000000000000400
> > [   24.716723] PKRU: 55555554
> > [   24.716726] Call Trace:
> > [   24.716731]  <TASK>
> > [   24.716738]  intel_pasid_setup_first_level+0x36/0x200
> > [   24.716753]  intel_svm_bind+0x2f8/0x3a0
> > [   24.716767]  iommu_sva_bind_device+0x9b/0xe0
> > [   24.716785]  idxd_pci_probe+0x259/0x1070 [idxd]
> > [   24.716866]  local_pci_probe+0x3e/0x80
> > [   24.716890]  work_for_cpu_fn+0x13/0x20
> > [   24.716900]  process_one_work+0x1c4/0x380
> > [   24.716912]  worker_thread+0x1ab/0x380
> > [   24.716922]  ? _raw_spin_lock_irqsave+0x23/0x50
> > [   24.716945]  ? process_one_work+0x380/0x380
> > [   24.716954]  kthread+0xe6/0x110
> > [   24.716967]  ? kthread_complete_and_exit+0x20/0x20
> > [   24.716976]  ret_from_fork+0x1f/0x30
> > [   24.716999]  </TASK>
> > [   24.717000] ---[ end trace 0000000000000000 ]---
> > [   24.717019] ------------[ cut here ]------------
> > 
> > regards,
> > Jerry
> > 
> 

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
