Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 528B23E542B
	for <lists.iommu@lfdr.de>; Tue, 10 Aug 2021 09:17:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B45A560806;
	Tue, 10 Aug 2021 07:17:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kbXS10K7zzzv; Tue, 10 Aug 2021 07:17:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id D1AFC60A81;
	Tue, 10 Aug 2021 07:17:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9CC4FC000E;
	Tue, 10 Aug 2021 07:17:21 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 57011C000E
 for <iommu@lists.linux-foundation.org>; Tue, 10 Aug 2021 07:17:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 31F6F8349A
 for <iommu@lists.linux-foundation.org>; Tue, 10 Aug 2021 07:17:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YReSEUlmW1CX for <iommu@lists.linux-foundation.org>;
 Tue, 10 Aug 2021 07:17:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 466A983546
 for <iommu@lists.linux-foundation.org>; Tue, 10 Aug 2021 07:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628579838;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MiJQ0VtQH9ot0EVFN/FpusLl8DGmShMhIr9rUyrSbi8=;
 b=caNOgj5j04dkvInUuMfLxJW0leZ3lgt/4jVBEZ5NYeOFdOAg0YtoF9zjWfCqisTlHhFcTj
 pvehX3wCM69xjrQLgjAfyUIYVHrecCLluhAqAhwcW4SeAjsAOdrJQEjYrAGSSMxmMi++nP
 3OQhjL+gTjpj1QFft7tbbQ8eIaSXbY8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-560-IRRGJ2GwPAq3AQ8iVrsvRA-1; Tue, 10 Aug 2021 03:17:15 -0400
X-MC-Unique: IRRGJ2GwPAq3AQ8iVrsvRA-1
Received: by mail-wm1-f72.google.com with SMTP id
 g70-20020a1c20490000b02902e6753bf473so720593wmg.0
 for <iommu@lists.linux-foundation.org>; Tue, 10 Aug 2021 00:17:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=MiJQ0VtQH9ot0EVFN/FpusLl8DGmShMhIr9rUyrSbi8=;
 b=dUN9qEsDnN2x1f1IvFKnvVBqKhdoe0TSflVgVq6f0wVxRxczQdMdWKQkTSyQlhnGAz
 kS29gkIYWVsyxGV7vHQoAC1SVcZAiwpzNKa2OqhI3X9oePQV+00uJXgFwppwub4LH52U
 aOMl2mYcQNm/nwNwr/iV1bF97plGU8aSdXcO5AWmueMvuHFG99un8Y5hBpE1vgF/cybe
 0RcRU1ij86LTESAWVaTYJHKltZeuys1JsC1kvT1ZfOmuvxMgo3ytvX/kzl9IK7vdOXJ8
 dSK4WGGtI9L4HaUYmPIJtsG5tCNXaMNtHN6SuDU+DDuLu8b/bADUGj7UjR/CAbfS72BC
 yUQg==
X-Gm-Message-State: AOAM533rl6CqG3LpRDoXwfoduB2NkK0k6zFY0TIkTYOp+dQpbMSYDT8z
 4Vxul0fp/Gpp8fGqJtR9p5OBTpjxUYNQXiRQ3VtgOYdHSUObSMayfxwj3HDTTOr2wUzMbLWb4ch
 UuOv7g9Jn9Tr901oPDi1Ab3qwzCO9kA==
X-Received: by 2002:adf:d1e4:: with SMTP id g4mr28689959wrd.371.1628579833737; 
 Tue, 10 Aug 2021 00:17:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw2sXBFQLPATOSL8T+i3nnZsUZlnH9PbhvTEdK3n2egew9pjkW+nMrccCqe/ExhSXeo0tjD2w==
X-Received: by 2002:adf:d1e4:: with SMTP id g4mr28689919wrd.371.1628579833497; 
 Tue, 10 Aug 2021 00:17:13 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id z17sm22634714wrt.47.2021.08.10.00.17.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Aug 2021 00:17:12 -0700 (PDT)
Subject: Re: [RFC v2] /dev/iommu uAPI proposal
To: "Tian, Kevin" <kevin.tian@intel.com>, Jason Gunthorpe <jgg@nvidia.com>,
 "Alex Williamson (alex.williamson@redhat.com)" <alex.williamson@redhat.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>, Jason Wang
 <jasowang@redhat.com>, "parav@mellanox.com" <parav@mellanox.com>,
 "Enrico Weigelt, metux IT consult" <lkml@metux.net>,
 Paolo Bonzini <pbonzini@redhat.com>, Shenming Lu <lushenming@huawei.com>,
 Joerg Roedel <joro@8bytes.org>
References: <BN9PR11MB5433B1E4AE5B0480369F97178C189@BN9PR11MB5433.namprd11.prod.outlook.com>
 <b83a25de-7c32-42c4-d99d-f7242cc9e2da@redhat.com>
 <BN9PR11MB5433453DED3546F5011C3BDD8CF29@BN9PR11MB5433.namprd11.prod.outlook.com>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <cec41751-c300-40f2-a8d6-f4916fb4a34e@redhat.com>
Date: Tue, 10 Aug 2021 09:17:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <BN9PR11MB5433453DED3546F5011C3BDD8CF29@BN9PR11MB5433.namprd11.prod.outlook.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: "Jiang, Dave" <dave.jiang@intel.com>, "Raj, Ashok" <ashok.raj@intel.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 David Woodhouse <dwmw2@infradead.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>, Kirti Wankhede <kwankhede@nvidia.com>,
 Robin Murphy <robin.murphy@arm.com>
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
Reply-To: eric.auger@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

Hi Kevin,

On 8/5/21 2:36 AM, Tian, Kevin wrote:
>> From: Eric Auger <eric.auger@redhat.com>
>> Sent: Wednesday, August 4, 2021 11:59 PM
>>
> [...] 
>>> 1.2. Attach Device to I/O address space
>>> +++++++++++++++++++++++++++++++++++++++
>>>
>>> Device attach/bind is initiated through passthrough framework uAPI.
>>>
>>> Device attaching is allowed only after a device is successfully bound to
>>> the IOMMU fd. User should provide a device cookie when binding the
>>> device through VFIO uAPI. This cookie is used when the user queries
>>> device capability/format, issues per-device iotlb invalidation and
>>> receives per-device I/O page fault data via IOMMU fd.
>>>
>>> Successful binding puts the device into a security context which isolates
>>> its DMA from the rest system. VFIO should not allow user to access the
>> s/from the rest system/from the rest of the system
>>> device before binding is completed. Similarly, VFIO should prevent the
>>> user from unbinding the device before user access is withdrawn.
>> With Intel scalable IOV, I understand you could assign an RID/PASID to
>> one VM and another one to another VM (which is not the case for ARM). Is
>> it a targetted use case?How would it be handled? Is it related to the
>> sub-groups evoked hereafter?
> Not related to sub-group. Each mdev is bound to the IOMMU fd respectively
> with the defPASID which represents the mdev.
But how does it work in term of security. The device (RID) is bound to
an IOMMU fd. But then each SID/PASID may be working for a different VM.
How do you detect this is safe as each SID can work safely for a
different VM versus the ARM case where it is not possible.

1.3 says
"

1)  A successful binding call for the first device in the group creates
    the security context for the entire group, by:
"
What does it mean for above scalable IOV use case?

>
>> Actually all devices bound to an IOMMU fd should have the same parent
>> I/O address space or root address space, am I correct? If so, maybe add
>> this comment explicitly?
> in most cases yes but it's not mandatory. multiple roots are allowed
> (e.g. with vIOMMU but no nesting).
OK, right, this corresponds to example 4.2 for example. I misinterpreted
the notion of security context. The security context does not match the
IOMMU fd but is something implicit created on 1st device binding.
>
> [...]
>>> The device in the /dev/iommu context always refers to a physical one
>>> (pdev) which is identifiable via RID. Physically each pdev can support
>>> one default I/O address space (routed via RID) and optionally multiple
>>> non-default I/O address spaces (via RID+PASID).
>>>
>>> The device in VFIO context is a logic concept, being either a physical
>>> device (pdev) or mediated device (mdev or subdev). Each vfio device
>>> is represented by RID+cookie in IOMMU fd. User is allowed to create
>>> one default I/O address space (routed by vRID from user p.o.v) per
>>> each vfio_device.
>> The concept of default address space is not fully clear for me. I
>> currently understand this is a
>> root address space (not nesting). Is that coorect.This may need
>> clarification.
> w/o PASID there is only one address space (either GPA or GIOVA)
> per device. This one is called default. whether it's root is orthogonal
> (e.g. GIOVA could be also nested) to the device view of this space.
>
> w/ PASID additional address spaces can be targeted by the device.
> those are called non-default.
>
> I could also rename default to RID address space and non-default to 
> RID+PASID address space if doing so makes it clearer.
Yes I think it is worth having a kind of glossary and defining root as,
default as as you clearly defined child/parent.
>
>>> VFIO decides the routing information for this default
>>> space based on device type:
>>>
>>> 1)  pdev, routed via RID;
>>>
>>> 2)  mdev/subdev with IOMMU-enforced DMA isolation, routed via
>>>     the parent's RID plus the PASID marking this mdev;
>>>
>>> 3)  a purely sw-mediated device (sw mdev), no routing required i.e. no
>>>     need to install the I/O page table in the IOMMU. sw mdev just uses
>>>     the metadata to assist its internal DMA isolation logic on top of
>>>     the parent's IOMMU page table;
>> Maybe you should introduce this concept of SW mediated device earlier
>> because it seems to special case the way the attach behaves. I am
>> especially refering to
>>
>> "Successful attaching activates an I/O address space in the IOMMU, if the
>> device is not purely software mediated"
> makes sense.
>
>>> In addition, VFIO may allow user to create additional I/O address spaces
>>> on a vfio_device based on the hardware capability. In such case the user
>>> has its own view of the virtual routing information (vPASID) when marking
>>> these non-default address spaces.
>> I do not catch what does mean "marking these non default address space".
> as explained above, those non-default address spaces are identified/routed
> via PASID. 
>
>>> 1.3. Group isolation
>>> ++++++++++++++++++++
> [...]
>>> 1)  A successful binding call for the first device in the group creates
>>>     the security context for the entire group, by:
>>>
>>>     * Verifying group viability in a similar way as VFIO does;
>>>
>>>     * Calling IOMMU-API to move the group into a block-dma state,
>>>       which makes all devices in the group attached to an block-dma
>>>       domain with an empty I/O page table;
>> this block-dma state/domain would deserve to be better defined (I know
>> you already evoked it in 1.1 with the dma mapping protocol though)
>> activates an empty I/O page table in the IOMMU (if the device is not
>> purely SW mediated)?
> sure. some explanations are scattered in following paragraph, but I
> can consider to further clarify it.
>
>> How does that relate to the default address space? Is it the same?
> different. this block-dma domain doesn't hold any valid mapping. The
> default address space is represented by a normal unmanaged domain.
> the ioasid attaching operation will detach the device from the block-dma
> domain and then attach it to the target ioasid.
OK

Thanks

Eric
>
>>> 2. uAPI Proposal
>>> ----------------------
> [...]
>>> /*
>>>   * Allocate an IOASID.
>>>   *
>>>   * IOASID is the FD-local software handle representing an I/O address
>>>   * space. Each IOASID is associated with a single I/O page table. User
>>>   * must call this ioctl to get an IOASID for every I/O address space that is
>>>   * intended to be tracked by the kernel.
>>>   *
>>>   * User needs to specify the attributes of the IOASID and associated
>>>   * I/O page table format information according to one or multiple devices
>>>   * which will be attached to this IOASID right after. The I/O page table
>>>   * is activated in the IOMMU when it's attached by a device. Incompatible
>> .. if not SW mediated
>>>   * format between device and IOASID will lead to attaching failure.
>>>   *
>>>   * The root IOASID should always have a kernel-managed I/O page
>>>   * table for safety. Locked page accounting is also conducted on the root.
>> The definition of root IOASID is not easily found in this spec. Maybe
>> this would deserve some clarification.
> make sense.
>
> and thanks for other typo-related comments.
>
> Thanks
> Kevin

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
