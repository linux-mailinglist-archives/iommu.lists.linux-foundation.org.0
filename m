Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 024094D8F01
	for <lists.iommu@lfdr.de>; Mon, 14 Mar 2022 22:46:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9D15040153;
	Mon, 14 Mar 2022 21:46:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W_68DeT0W8zP; Mon, 14 Mar 2022 21:46:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 645184052C;
	Mon, 14 Mar 2022 21:46:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 12ACFC0084;
	Mon, 14 Mar 2022 21:46:40 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9AD0DC000B
 for <iommu@lists.linux-foundation.org>; Mon, 14 Mar 2022 21:46:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 85F3C401CC
 for <iommu@lists.linux-foundation.org>; Mon, 14 Mar 2022 21:46:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c8TLZkk2qIAk for <iommu@lists.linux-foundation.org>;
 Mon, 14 Mar 2022 21:46:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20624.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::624])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 72AAA40153
 for <iommu@lists.linux-foundation.org>; Mon, 14 Mar 2022 21:46:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g1YeCxQ4QmKqrsBALcquhemm6+mHUboUKm7uy1LswaHhra2IdB4UqSE6qne8Z1GSGsz+61i0PqmE/wprCKo+xtxN2UZDO05urjUQcIyM653n3WuiFxFlByNXi0gKNilTk6CPb/07Hw2TuTOJq1nNX/u2hXehIFmtZc8bt//rN6q76vIgQHiJISRWxJH81ePxWabtqKkcai2NXgnMZLiD9/Yyb+tNAO+KJjXYQHKaYiqeie5NZEw/rhtH/sE3r726pzGisDyCgc7cg5Piw0Fp1/t2sFaQxPEHqp10/EKEeJ28Hr9mn2+pb4WxU1HQu4qzdivKJHJWX9imx6SuBThwrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v7EZn/VfW69uGQqxlHNhNaahdQBT6IpUUwCT4MMNsT0=;
 b=JYhHx5M+D2Nm83Tx/iCIm4IhFJbEm4qCp6HcyhqeAJX99bPciiaFcK0x60thP0zr1moRebQddRmg39Fg50h6IkdQ5TuarxS/EBvQ/FFH+3ncFna2otEDiYClcnzAJ4EscFCp2rsJue8Hx+WiH/+jHmVClrsUTqubVuU3rxWGGOjJhIOLDiavowAfrCXPOy+tf6vJOj4hbH78o6JLoB9hTmgyXpUYbVD7Dcsnepe9rCPPTtwkM1DfVlPudRuA2Jns9xNQAG0jNtS52I06goxjItWkwriJ+fqC+hqoXWjuzAu7L/wbvIbECicS9eLVam5L7s6ckrma4T1kJ/JuG0oKxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v7EZn/VfW69uGQqxlHNhNaahdQBT6IpUUwCT4MMNsT0=;
 b=dL2ILdA5dNBIR4lDweCmbl7k/wl2eMyIR3HsvqxloMt0HkJIGG/4RIGQsp0rtwCcOSq9GNNH0alw9isyYHehSiqvAA2MEkMk23dRgsKamAg+JQK1jiXMqSKRTCUjMdBEAxY85+1qVizxn+L2814XpEMsalSSZGXc7cBGV+vaqJzGLmOlP7VHjSp2v1HHgKrl33I3vFzXnjsjl0eCTmEL09tt3GqgR4K7uu0Tj4i9C2nw9S8WZeACe0YGiCFY1+nGbpTpbNW6xfad3QVd3Ndr6xLaI0MQGaYCsZJt4GjGpkCgp39286x4LLZnqfQRAk2X2IE25BWAYMkL3r4fzUTf7w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by BY5PR12MB3844.namprd12.prod.outlook.com (2603:10b6:a03:1ad::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.24; Mon, 14 Mar
 2022 21:46:34 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::51a0:4aee:2b4c:ca28]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::51a0:4aee:2b4c:ca28%4]) with mapi id 15.20.5061.028; Mon, 14 Mar 2022
 21:46:34 +0000
Date: Mon, 14 Mar 2022 18:46:33 -0300
To: Matthew Rosato <mjrosato@linux.ibm.com>
Subject: Re: [PATCH v4 22/32] KVM: s390: pci: routines for (dis)associating
 zPCI devices with a KVM
Message-ID: <20220314214633.GJ11336@nvidia.com>
References: <20220314194451.58266-1-mjrosato@linux.ibm.com>
 <20220314194451.58266-23-mjrosato@linux.ibm.com>
Content-Disposition: inline
In-Reply-To: <20220314194451.58266-23-mjrosato@linux.ibm.com>
X-ClientProxiedBy: MN2PR04CA0009.namprd04.prod.outlook.com
 (2603:10b6:208:d4::22) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a9f0b58d-54ca-4bea-e322-08da06041bbc
X-MS-TrafficTypeDiagnostic: BY5PR12MB3844:EE_
X-Microsoft-Antispam-PRVS: <BY5PR12MB384442CB52263A7A7F3802BBC20F9@BY5PR12MB3844.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZmuYTzqfrOkoQ/eogTg4Y7F9lYEsNPB14u0E30QdHZ1LU/uxyZR4cPwliHNEPQyGjSJcAKeYc/r7m04ZQmKICw2E2b4R42kAH6dvySpxUtUKwoFUjQGsDVXvpOGhYhsRGBxoBCa+Z+lz/iKV9o1icl2fVRnhawPDseMHbx2CPh7qrL3/2K8f8lln1Su0A4HdL5pPiM9XbKAfRrNndEPWEBnZpexIahCV9YbNXo2dTg/+agjUChAbySL1hQxoEcwQLIaLUflud6s8TAUpnN87wSZdHBR7mpn+vh4I1vFE5OwIaW1xWhpbym6KvN3XX7jM5nDeiJD2IFRbB28OcD4KMnqVL+st+2BIPl0t/5gNt3OZj5fXsqD7SSxKPyMOLXKi6iAJe0oHdmaBPrVrDu0g54ZC9xNG2f4I+V+XJnlkEIXkuGmUfqWsdEDch6HMfP+aLp4bYKT1iveXN6qQZNl0lt5Js1FevFa7dPYZwMhRa9x+Mo7oCUJVrz76Mb3TVVcPtZBFWto29hUVf+uLYt8qsRauxACKx8tvGhgRES2cEyNqJteuXa9pvYed1V9FejOHjlRha4bSLplNKIn4/+YWVy2evTCe5rIN9DIwQDuxVghRCddVL2NVvaXh+K0By/7ZwP8ZxeUg2geliup6T/HLTg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(316002)(36756003)(8676002)(2906002)(6916009)(66946007)(66556008)(66476007)(4326008)(7416002)(6506007)(33656002)(6486002)(6512007)(5660300002)(8936002)(508600001)(26005)(2616005)(186003)(1076003)(86362001)(83380400001)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tV4b0M1daxj73Gn+rSemXRrRx/ShwVsd+gKfe4s+voymTHU2zX5Oeaf7RIAf?=
 =?us-ascii?Q?F5uFbM9yeXvD5NGzoWBmspsbCu6j0EGoSJyHrnjTNR1L72llHF/DIEYHk5qV?=
 =?us-ascii?Q?ZPxEvAQKCGH7m/ta3jTPBxNQxLG1XDG64X/H58foUkhdZxbYUgZ9fxJ1AZ2e?=
 =?us-ascii?Q?a7HnGeDGaE7HQek9HM9ENFuxMii2MIteyY+pmzyQIgmO1HA35fSeV7fuJYv1?=
 =?us-ascii?Q?l5iiEJFQm9XjjdhPuIy0vcmd+Rtd4MLJOT+ZOgzKShq02Hz5H5waTDKCzXAP?=
 =?us-ascii?Q?A3pL9j3N5PfHil1mVGVaVfbFMAzF/FKAiYrrzi3c0MXzSh18yzVuXu/tFDeh?=
 =?us-ascii?Q?gv/vR11h82u6LQSQCRCROLQA7nSOTgquvjTY7MBL/5/PYowWJ1XfR1rtOacY?=
 =?us-ascii?Q?57dF8WsfhE5d/BfLmI00coOJbnHg3meyiT6Z6J68Hym4aZwB20WYA1FEYEJ2?=
 =?us-ascii?Q?7hQCUXJ7VRuBQg3hbiKBat5B1nPaGH7kCePxhK7jsHTirXZjwzu201+rrLRu?=
 =?us-ascii?Q?xZkh746XYIoDGhBpZVHcIGF+WR3IZHe4BfnutxHtATiEVN+0H/4ukGyIzNZF?=
 =?us-ascii?Q?JiUNBmT6q/wTGrmW9Bi26jcknq8nbdtbRDzeHdYMUwjp11R4mzhNkjWlODsF?=
 =?us-ascii?Q?s4TrFJT0EF7eQd5ksLOVzZL0dTf9FNsAzDFVdOXDg+GI254fRyEc0QKAX3GZ?=
 =?us-ascii?Q?YDrSSJxIVN6r8swp2J0NGgNNtbzkTBNWdUac3c1P2GSi9/Jx/NekfnBhFzT1?=
 =?us-ascii?Q?6soQDYp1ptfB/dpEVM7PSgU93yuM5CvA0JNnsfLSP8qjmkEAxgbARBceYZhV?=
 =?us-ascii?Q?70q20siFUBLATZRth9H/ezuVVUElOCc3KkPpcDQa8Xf9DMczPR4G5zI/fGKq?=
 =?us-ascii?Q?U+8lRAZkGmH96Ye514/W/A5kHvuHtXaDAwllpAPsgtg63aAIcP1ml1NhGDiZ?=
 =?us-ascii?Q?3owaq8XEzqynyqGThGMAGqcMzIYaYW2kX3RpesyMAsT8RhllYw8Dugv0KVKK?=
 =?us-ascii?Q?ACPrEla9F9rWLJBljqwy/440HpRHEWn1C0KwwOv0DeMNFiYL1YF4HLZ+h9AP?=
 =?us-ascii?Q?VRe72/WHHYJWysqlY3xOuERn56kN4oEpFYVYiULgAcN3XRMPaEzkJrEsJRFF?=
 =?us-ascii?Q?NjO5pob100wwpxKYbG6rpIWzqEF9OIvZkVgi2xo4wFtM69OQwJsoCEIKInIf?=
 =?us-ascii?Q?tFrnmUVYdHRjHB4HQ3ux1/KvR9So4/ral2fBAhMjX8uxmA0yS/J444yeQENC?=
 =?us-ascii?Q?Z8T80J/5ZD5F3mCAZd5sOKX7l2UuOnIobigtbIxPdIvO0NZkb/p6du3ihm7j?=
 =?us-ascii?Q?5FdPa9y1rP+ZiMv/cdchLwV78gprbEVIEHVBaq78ZvxzDxU0vgz3RQThjY27?=
 =?us-ascii?Q?SH9qSAkFhWmpaWTYwKUaeRpPUXJGA2jGaNvM8qQnaKeoVzznosU9VsEOyNhc?=
 =?us-ascii?Q?JCMZZSbIpfGm0Jx6Zm/7zdNeFADBkVA5?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9f0b58d-54ca-4bea-e322-08da06041bbc
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2022 21:46:34.2919 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7uI8yZkSLCkBHK3rZM+YKxAD5TYfO82PfCN9u4aW5xk9vxmf7LUeQjmEiquRETfd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3844
Cc: kvm@vger.kernel.org, david@redhat.com, thuth@redhat.com,
 linux-kernel@vger.kernel.org, vneethv@linux.ibm.com, agordeev@linux.ibm.com,
 imbrenda@linux.ibm.com, will@kernel.org, linux-s390@vger.kernel.org,
 frankja@linux.ibm.com, corbet@lwn.net, linux-doc@vger.kernel.org,
 pasic@linux.ibm.com, gerald.schaefer@linux.ibm.com, borntraeger@linux.ibm.com,
 farman@linux.ibm.com, gor@linux.ibm.com, schnelle@linux.ibm.com,
 hca@linux.ibm.com, alex.williamson@redhat.com, freude@linux.ibm.com,
 pmorel@linux.ibm.com, cohuck@redhat.com, oberpar@linux.ibm.com,
 iommu@lists.linux-foundation.org, svens@linux.ibm.com, pbonzini@redhat.com
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
From: Jason Gunthorpe via iommu <iommu@lists.linux-foundation.org>
Reply-To: Jason Gunthorpe <jgg@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On Mon, Mar 14, 2022 at 03:44:41PM -0400, Matthew Rosato wrote:
> +int kvm_s390_pci_zpci_start(struct kvm *kvm, struct zpci_dev *zdev)
> +{
> +	struct vfio_device *vdev;
> +	struct pci_dev *pdev;
> +	int rc;
> +
> +	rc = kvm_s390_pci_dev_open(zdev);
> +	if (rc)
> +		return rc;
> +
> +	pdev = pci_get_slot(zdev->zbus->bus, zdev->devfn);
> +	if (!pdev) {
> +		rc = -ENODEV;
> +		goto exit_err;
> +	}
> +
> +	vdev = get_vdev(&pdev->dev);
> +	if (!vdev) {
> +		pci_dev_put(pdev);
> +		rc = -ENODEV;
> +		goto exit_err;
> +	}
> +
> +	zdev->kzdev->nb.notifier_call = kvm_s390_pci_group_notifier;
> +
> +	/*
> +	 * At this point, a KVM should already be associated with this device,
> +	 * so registering the notifier now should immediately trigger the
> +	 * event.  We also want to know if the KVM association is later removed
> +	 * to ensure proper cleanup happens.
> +	 */
> +	rc = register_notifier(vdev->dev, &zdev->kzdev->nb);
> +
> +	put_vdev(vdev);
> +	pci_dev_put(pdev);
> +
> +	/* Make sure the registered KVM matches the KVM issuing the ioctl */
> +	if (rc || zdev->kzdev->kvm != kvm) {
> +		rc = -ENODEV;
> +		goto exit_err;
> +	}
> +
> +	/* Must support KVM-managed IOMMU to proceed */
> +	if (IS_ENABLED(CONFIG_S390_KVM_IOMMU))
> +		rc = zpci_iommu_attach_kvm(zdev, kvm);
> +	else
> +		rc = -EINVAL;

This seems like kind of a strange API, shouldn't kvm be getting a
reference on the underlying iommu_domain and then calling into it to
get the mapping table instead of pushing KVM specific logic into the
iommu driver?

I would be nice if all the special kvm stuff could more isolated in
kvm code.

I'm still a little unclear about why this is so complicated - can't
you get the iommu_domain from the group FD directly in KVM code as
power does?

Jason
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
