Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3ED181D1C
	for <lists.iommu@lfdr.de>; Wed, 11 Mar 2020 17:02:51 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5261F87FA1;
	Wed, 11 Mar 2020 16:02:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GRGDhUtyQj7L; Wed, 11 Mar 2020 16:02:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 96BEA876C9;
	Wed, 11 Mar 2020 16:02:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7CB6CC0177;
	Wed, 11 Mar 2020 16:02:49 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 22F40C0177
 for <iommu@lists.linux-foundation.org>; Wed, 11 Mar 2020 16:02:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 0BB9A85815
 for <iommu@lists.linux-foundation.org>; Wed, 11 Mar 2020 16:02:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SKbgmRXEqAUa for <iommu@lists.linux-foundation.org>;
 Wed, 11 Mar 2020 16:02:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id A473B857FB
 for <iommu@lists.linux-foundation.org>; Wed, 11 Mar 2020 16:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1583942561;
 bh=KLvlybP6izJLHS8Yx1hNPwQTc/Z8DVIZJbmUc/IaMkA=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=cFe1z4blMiKlb/83nuT32gLLT4qS2gE2bILhOpj5QqjPbBZ1602LRqt+6uBPtLgyp
 rV6ydWvwdbl+p8lr5WiuoBr6GWtkQgOkl3DYoBuVhrpmmQYWehtSlsIX1WZKSwcGZb
 u/JXn5hzFTBSZTaxjAkKG9SgruLNsWZAc4Hw1Y1g=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [10.81.10.6] ([196.52.84.30]) by mail.gmx.com (mrgmx004
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1Mv2xO-1jTriS3kPI-00qzqq; Wed, 11
 Mar 2020 17:02:41 +0100
Subject: Re: [Bug 206175] Fedora >= 5.4 kernels instantly freeze on boot
 without producing any display output
To: Christoph Hellwig <hch@lst.de>
References: <bug-206175-5873@https.bugzilla.kernel.org/>
 <bug-206175-5873-S6PaNNClEr@https.bugzilla.kernel.org/>
 <CAHk-=wi4GS05j67V0D_cRXRQ=_Jh-NT0OuNpF-JFsDFj7jZK9A@mail.gmail.com>
 <20200310162342.GA4483@lst.de>
 <CAHk-=wgB2YMM6kw8W0wq=7efxsRERL14OHMOLU=Nd1OaR+sXvw@mail.gmail.com>
 <20200310182546.GA9268@lst.de> <20200311152453.GB23704@lst.de>
 <e70dd793-e8b8-ab0c-6027-6c22b5a99bfc@gmx.com>
 <20200311154328.GA24044@lst.de> <20200311154718.GB24044@lst.de>
From: "Artem S. Tashkinov" <aros@gmx.com>
Message-ID: <962693d9-b595-c44d-1390-e044f29e91d3@gmx.com>
Date: Wed, 11 Mar 2020 16:02:39 +0000
MIME-Version: 1.0
In-Reply-To: <20200311154718.GB24044@lst.de>
Content-Language: ru
X-Provags-ID: V03:K1:+Iv1FPWVT5M+d9MWseXxelvnNscSAb7oqE5WRiQPVdF0R7QF/zt
 LmlgvyR8wbdhkPzqHLX0fb2nI+t7KsNFmtwJpJVw88PElF2aFvpWurhrD4CicggUya0Cw6p
 qIw5S8XKSpuSWSagFf0dFlB5QUZbmhw5XrwAXW66tT9DuLRSOahQPTq8nK7B4ABs89qWLcZ
 yQnJQe6jbtYIulpeVpNqw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:20xPB2B7YW8=:BmycET+LBSeqQ5adbK0AsY
 1vz03iHAEs7+yZI1YxP8yDp+mrRqxrw/KwITUz6xWl4GySPAzkK6whyeRYD5wMTS3/RPsHzMD
 HSHZOAseij2pU6G3sRBvUrAyDiU5DWQHUNRqQnke1K7kxM1EXYWSz9GqgI4KUmk0wmO31RuGx
 crRxnuBO3R/yDvdtM/ZSqcwmkGcJ//W4UqIWx+1Hiom1HEapvuZRGJupiiUWxTxKOux/cXDTl
 mI0o86NILYpd6MJGoDvFde22nbosL2qXd4uMx4W3UnB2556ySldv35CuIgiduSI/twei2uCZY
 kN6CENvUMNVyf9u8piM4XtdELAPOEk9dFgkmxhuo/JfxS2/nKGUw1gStAVi2Qh4jwkUZVujFi
 QkTz0ye5iWSSVfnXteS+B0Eo00WrhrrvugM9UEtJPwaJ2VTmtqrDoBGMo86fEDJ/GhRJO2PgU
 qyHost3441s2BUHLzvEa4mLcLvaDmBzam/rEtJUriGob0vblfhIh5gLJ/XyIiMoMmOnG7eyoZ
 79c/C/wITtV+MZbfhFdB7EDF4do4wyHnkERrxtgxcnBxwGqDZNv8xnQE51XjYw8AkviV5hK5W
 DYtDnXmx1wl8oAY927M8hVb+l4GKLEBP9c13olMiu4E28a9cw7AMRo+FUf0EN3sJUErIaMvyl
 WCInvWwXg1G/DIJ6+1JZL3KKs2vleKlXppqDo2nGytrcKBYKDcfp8J4ejp6Y7Z1AYAzSiXcsH
 B5XYRtfi+Zg0SPpNb1Ei+0Ccv3B0p3hrYwEl9bL6e7uuZIGq1kHvRYxnsrj7FMC7e0VolUOzI
 8wgESR1zr0QLQq/PjDz1+qvH6JpLDROgjU72oiTJpfgwgs+SzTA8y2au8NqgRaKa/wR0qBGzJ
 Nn9w8dTuplM/EhzPM8weHoFYtTqvOT+IqVxd+X9gGQ2rnrtDF0rDYprtHfDlzblVgmjkFuP+B
 v8K/URZ4RSCknEg2CVv7KA7uYgMQlw4mzamqD1vCi+UQt6PCxUppTIIShGBYhmq9s0TXvcTUr
 lanoKA/w4zNWmiDX2pjvr1fIB9SjXA7DjvDXYja2ITtK+BessoyqMlVwGDxk9I5YK+J2wVu3Q
 XVimO1kkrW0UEoL3pS7oUB7EuqPIVnNLx0JLZTnil/c7bw13VT3/qV9RWK2grsJiLActb6/TA
 2CegRTC7T1i1AwNAJbsWWTaCnio4Py2lX2AwVdT4LKv2PEEvA7OOyhgK/OFpOyph/nSihUjsE
 xe6JT3u5L301fs5Qa
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 iommu@lists.linux-foundation.org,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>



On 3/11/20 3:47 PM, Christoph Hellwig wrote:
> And actually one more idea after looking at what slab interactions
> could exist.  platform_device_register_full frees the dma_mask
> unconditionally, even if it didn't allocated it, which might lead
> to weird memory corruption if we hit the failure path.  So let's try
> something like this, replacing the earlier patch in that file.
>
> diff --git a/drivers/base/platform.c b/drivers/base/platform.c
> index b230beb6ccb4..04080a8d94e2 100644
> --- a/drivers/base/platform.c
> +++ b/drivers/base/platform.c
> @@ -632,19 +632,6 @@ struct platform_device *platform_device_register_full(
>   	pdev->dev.of_node_reused = pdevinfo->of_node_reused;
>
>   	if (pdevinfo->dma_mask) {
> -		/*
> -		 * This memory isn't freed when the device is put,
> -		 * I don't have a nice idea for that though.  Conceptually
> -		 * dma_mask in struct device should not be a pointer.
> -		 * See http://thread.gmane.org/gmane.linux.kernel.pci/9081
> -		 */
> -		pdev->dev.dma_mask =
> -			kmalloc(sizeof(*pdev->dev.dma_mask), GFP_KERNEL);
> -		if (!pdev->dev.dma_mask)
> -			goto err;
> -
> -		kmemleak_ignore(pdev->dev.dma_mask);
> -
>   		*pdev->dev.dma_mask = pdevinfo->dma_mask;
>   		pdev->dev.coherent_dma_mask = pdevinfo->dma_mask;
>   	}
> @@ -670,7 +657,6 @@ struct platform_device *platform_device_register_full(
>   	if (ret) {
>   err:
>   		ACPI_COMPANION_SET(&pdev->dev, NULL);
> -		kfree(pdev->dev.dma_mask);
>   		platform_device_put(pdev);
>   		return ERR_PTR(ret);
>   	}
>

With this patch the system works (I haven't created an initrd, so it
doesn't completely boot and panics on not being able to mount root fs
but that's expected).
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
